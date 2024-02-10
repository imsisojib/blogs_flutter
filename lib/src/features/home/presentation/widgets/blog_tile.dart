import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/image/circular_image.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/models/bog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class BlogTile extends StatelessWidget{
  final Blog? blog;
  final Function? onAddFav;
  final Function? onRemoveFav;

  BlogTile({super.key, this.blog, this.onAddFav, this.onRemoveFav});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircularImage(
                        imageUrl:
                        blog?.owner?.profileImage ?? "",
                        errorWidget: Icon(Icons.person),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${blog?.owner?.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Share Sorce: ${blog?.share?.shareSource}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if(blog?.isFav??false){
                        //remove fav
                        onRemoveFav?.call(blog?.id);
                      }else{
                        //add fav
                        onAddFav?.call(blog?.id);
                      }
                    },
                    icon: blog?.isFav??false
                        ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                        : Icon(Icons.favorite_border)),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Share Description",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h,),
            HtmlWidget(blog?.owner?.bio??""),
          ],
        ),
      ),
    );
  }
}