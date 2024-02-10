import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/di_container.dart';
import 'package:flutter_boilerplate_code/src/core/data/models/empty.dart';
import 'package:flutter_boilerplate_code/src/core/enums/e_loading.dart';
import 'package:flutter_boilerplate_code/src/features/home/application/usecases/usecase_fetch_blogs.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/models/bog.dart';

class ProviderBlogs extends ChangeNotifier {
  //states
  ELoading? _loading;
  List<Blog> _blogs = [];

  //getters
  ELoading? get loading => _loading;

  List<Blog> get blogs => _blogs;

  //setters
  set loading(ELoading? state) {
    _loading = state;
    notifyListeners();
  }

  void fetchBlogs() async {
    loading = ELoading.loading;
    var result = await sl<UseCaseFetchBlogs>().execute(Empty());
    result.fold(
      (error) {

      },
      (response) {
        _blogs = response;
      },
    );

    loading = null;
  }

  void removeFavouriteByBlogId(String? id) {
    if(id==null) return;
    int index = _blogs.indexWhere((element) => element.id == id);
    if(index!=-1){
      _blogs[index].isFav = false;
      notifyListeners();
    }
  }

  void setFavouriteByByBlogId(String? id) {
    if(id==null) return;
    int index = _blogs.indexWhere((element) => element.id == id);
    if(index!=-1){
      _blogs[index].isFav = true;
      notifyListeners();
    }

  }
}
