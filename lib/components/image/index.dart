import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';

class ComponentCacheImage extends StatelessWidget {
  const ComponentCacheImage({Key key, this.imageUrl, this.width, this.height}) : super(key: key);
  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      placeholder: (_, __) => ComponentLoading(),
      fit: BoxFit.cover,
    );
  }
}
