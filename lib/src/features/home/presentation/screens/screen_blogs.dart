import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/enums/e_loading.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/image/circular_image.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/providers/provider_blogs.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/blog_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class ScreenBlogs extends StatefulWidget {
  const ScreenBlogs({super.key});

  @override
  State<ScreenBlogs> createState() => _ScreenBlogsState();
}

class _ScreenBlogsState extends State<ScreenBlogs> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderBlogs>(context, listen: false).fetchBlogs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(body: Consumer<ProviderBlogs>(
      builder: (_, providerBlogs, child) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                "Favourite List",
              ),
              centerTitle: true,
              pinned: true,
            ),
            providerBlogs.loading == ELoading.loading
                ? const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SliverList.builder(
                    itemCount: providerBlogs.blogs.length,
                    itemBuilder: (_, index) {
                      return BlogTile(
                        blog: providerBlogs.blogs[index],
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
    ));
  }
}
