import 'package:flutter/material.dart';

import 'network_image_loader.dart';

class CircularImage extends StatelessWidget {
  final double? size;
  final String imageUrl;
  final Widget? errorWidget;
  final Widget? placeholder;
  final Map<String, String>? httpHeaders;

  const CircularImage({
    super.key,
    this.size = 60,
    required this.imageUrl,
    this.errorWidget,
    this.placeholder,
    this.httpHeaders,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: NetworkImageLoader(
          //httpHeaders: httpHeaders,
          imageUrl: imageUrl,
          height: size,
          width: size,
          //fit: BoxFit.cover,
          placeholder: placeholder,
          errorWidget: errorWidget,
        ),
      ),
    );
  }
}
