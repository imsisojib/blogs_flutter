import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/basic_button.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/models/bog.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/providers/provider_blogs.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/blog_tile.dart';

class ScreenFavourites extends StatelessWidget {
  const ScreenFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(child: Scaffold(
      body: Consumer<ProviderBlogs>(
        builder: (_, providerBlogs, child) {
          if (providerBlogs.blogs.isEmpty) {
            return Center(
              child: Text(
                "Hey! Welcome 👋",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          List<Blog> blogs = providerBlogs.blogs.where((element) => element.isFav==true).toList();

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList.builder(
                itemCount: blogs.length,
                itemBuilder: (_, index) {
                  return BlogTile(
                    blog: blogs[index],
                    onAddFav: (String? id){
                      providerBlogs.setFavouriteByByBlogId(id);
                    },
                    onRemoveFav: (String? id){
                      providerBlogs.removeFavouriteByBlogId(id);
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        height: 120.h,
        child: Column(
          children: [
            BasicButton(
              buttonText: "Add Favourite",
              buttonTextStyle: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: 16,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.blogsScreen,
                );
              },
            ),
          ],
        ),
      ),
    ),);
  }
}
