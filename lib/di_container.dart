import 'package:flutter_boilerplate_code/src/config/config_api.dart';
import 'package:flutter_boilerplate_code/src/core/application/api_interceptor.dart';
import 'package:flutter_boilerplate_code/src/core/application/navigation_service.dart';
import 'package:flutter_boilerplate_code/src/core/application/token_service.dart';
import 'package:flutter_boilerplate_code/src/core/data/repositories/cache_repository_impl.dart';
import 'package:flutter_boilerplate_code/src/core/domain/interfaces/interface_api_interceptor.dart';
import 'package:flutter_boilerplate_code/src/core/domain/interfaces/interface_cache_repository.dart';
import 'package:flutter_boilerplate_code/src/features/home/application/usecases/usecase_fetch_blogs.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/repositories/repository_blog.dart';
import 'package:flutter_boilerplate_code/src/features/home/domain/interface_repository_blog.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/providers/provider_blogs.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/providers/provider_common.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //using dependency-injection
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //interceptors
  sl.registerLazySingleton<IApiInterceptor>(() => ApiInterceptor(baseUrl: ConfigApi.baseUrl));   ///CHANGE SERVER HERE


  ///REPOSITORIES
  //#region Repositories
  sl.registerLazySingleton<ICacheRepository>(() => CacheRepositoryImpl(sharedPreference: sl()));
  sl.registerLazySingleton<IRepositoryBlog>(() => RepositoryBlog(apiInterceptor: sl(), tokenService: sl()));
  //#endregion

  ///USE-CASES
  sl.registerLazySingleton(() => UseCaseFetchBlogs(repositoryBlogs: sl()));

  ///END of USE-CASES

  ///PROVIDERS
  //region Providers
  sl.registerFactory(() => ProviderCommon(),);
  sl.registerFactory(() => ProviderBlogs(),);

  ///services
  sl.registerSingleton(NavigationService());  //to initialize navigator-key for app-runtime
  sl.registerSingleton(TokenService()); //token service to store token app-runtime
  //logger
  sl.registerLazySingleton(()=>Logger(
    printer: PrettyPrinter(
      colors: false,
    ),
  ),);

}