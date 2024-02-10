import 'package:fluro/fluro.dart';
import 'package:flutter_boilerplate_code/src/features/errors/presentation/screens/screen_error.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/screens/screen_blogs.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/screens/screen_favourites.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';


class RouterHelper {
  static final FluroRouter router = FluroRouter();

  ///Handlers
  static final Handler _favouritesScreenHandler =
  Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenFavourites();
  });


  static final Handler _blogsScreenHandler =
  Handler(handlerFunc: (context, Map<String, dynamic> parameters) {
    return const ScreenBlogs();
  });

  static final Handler _notFoundHandler =
  Handler(handlerFunc: (context, parameters) => const ScreenError());

  void setupRouter() {
    router.notFoundHandler = _notFoundHandler;

    //main-nav flow
    router.define(Routes.favouriteScreen, handler: _favouritesScreenHandler, transitionType: TransitionType.cupertino);
    router.define(Routes.blogsScreen, handler: _blogsScreenHandler, transitionType: TransitionType.cupertino);
  }

}