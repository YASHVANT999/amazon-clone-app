import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String imageUrl;
  const SingleProduct({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.black),
            borderRadius: BorderRadiusDirectional.circular(5)),
        child: Container(
          height: 180,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
