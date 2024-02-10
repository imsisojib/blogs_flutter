import 'package:flutter_boilerplate_code/src/core/data/models/api_response.dart';

abstract class IRepositoryBlog{
  Future<ApiResponse> fetchBlogs();
}