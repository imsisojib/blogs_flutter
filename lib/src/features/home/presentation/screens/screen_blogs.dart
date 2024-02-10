import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/enums/e_loading.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/image/circular_image.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/providers/provider_blogs.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/blog_tile.dart';
import 'package:flutter_boilerplate_code/src/resources/app_colors.dart';
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
              toolbarHeight: kToolbarHeight.h + 16,
            ),

            SliverToBoxAdapter(
              child: Container(
                height: kToolbarHeight.h - 10,
                decoration: BoxDecoration(
                    color: AppColors.grey75,
                    borderRadius: BorderRadius.circular(12.h),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                margin: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 12.w,
                    ),
                    Icon(
                      Icons.search,
                      size: 18.h,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        //initialValue: initialValue,
                        autofocus: true,
                        //controller: textEditingController,
                        onFieldSubmitted: (value) {
                          providerBlogs.searchBlogs(value);
                        },
                        textAlign: TextAlign.start,
                        //controller: controller,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        maxLines: 1,
                        style: theme.textTheme.bodySmall,
                        cursorColor: AppColors.red,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "search by user name",
                          hintStyle: theme.textTheme.labelSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
