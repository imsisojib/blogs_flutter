import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate_code/src/core/data/models/empty.dart';
import 'package:flutter_boilerplate_code/src/core/data/models/failure.dart';
import 'package:flutter_boilerplate_code/src/core/domain/interfaces/interface_use_case.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/models/bog.dart';
import 'package:flutter_boilerplate_code/src/features/home/domain/interface_repository_blog.dart';
import 'package:flutter_boilerplate_code/src/helpers/debugger_helper.dart';

class UseCaseFetchBlogs implements IUseCase<Empty, List<Blog>> {
  final IRepositoryBlog repositoryBlogs;

  UseCaseFetchBlogs({required this.repositoryBlogs});

  @override
  Future<Either<Failure, List<Blog>>> execute(_) async {
    var response = await repositoryBlogs.fetchBlogs();
    if (response.statusCode != 200) {
      try{
        return Left(Failure(""));
      }catch(e){
        return Left(Failure(""));
      }
    }

    try {

      var json = jsonDecode(response.result);
      List<Blog> blogs = [];
      json["lists"].forEach((e){
        blogs.add(Blog.fromJson(e));
      });

      return Right(blogs);
    } catch (e) {
      Debugger.debug(title: "UseCaseFetchBlogs().parsing-error",data: e);
      return Left(
        Failure(""),
      );
    }
  }
}
