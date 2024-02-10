import 'package:flutter_boilerplate_code/src/config/config_api.dart';
import 'package:flutter_boilerplate_code/src/core/application/api_interceptor.dart';
import 'package:flutter_boilerplate_code/src/core/application/token_service.dart';
import 'package:flutter_boilerplate_code/src/core/data/models/api_response.dart';
import 'package:flutter_boilerplate_code/src/core/domain/interfaces/interface_api_interceptor.dart';
import 'package:flutter_boilerplate_code/src/features/home/domain/interface_repository_blog.dart';
import 'package:flutter_boilerplate_code/src/helpers/debugger_helper.dart';
import 'package:http/http.dart' as http;

class RepositoryBlog implements IRepositoryBlog{
  final IApiInterceptor apiInterceptor;
  final TokenService tokenService;

  RepositoryBlog({required this.apiInterceptor, required this.tokenService,});

  @override
  Future<ApiResponse> fetchBlogs() async {
    Debugger.info(
      title: 'RepositoryBlog.fetchBlogs(): request',
    );

    http.Response response = await apiInterceptor.get(
      endPoint: ConfigApi.blogList,
      headers: tokenService.getUnAuthHeadersForJson(),
    );

    Debugger.info(
      title: 'RepositoryBlog.fetchBlogs(): response',
      data: response.body,
      statusCode: response.statusCode,
    );

    return ApiResponse(statusCode: response.statusCode, result: response.body);
  }


}