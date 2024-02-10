import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageLoader extends StatelessWidget {
  final Map<String, String>? httpHeaders;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final String imageUrl;
  final BoxFit? fit;

  const NetworkImageLoader(
      {super.key,
      this.httpHeaders,
      this.height,
      this.width,
      this.placeholder,
      this.errorWidget,
      required this.imageUrl,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? errorWidget ?? const SizedBox()
        : CachedNetworkImage(
            httpHeaders: httpHeaders,
            height: height,
            width: width,
            imageUrl: imageUrl,
            fit: fit,
            errorWidget: (_, reason, data) {
              return errorWidget ?? const SizedBox();
            },
            placeholder: (_, str) {
              return placeholder ??
                  const Center(
                    child: CircularProgressIndicator(),
                  );
            },
          );
  }

}
