import 'package:flutter/material.dart';

class Brasao extends StatelessWidget {
  final String? image;
  final double? width;

  const Brasao({super.key, this.image, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: image!,
        child: Image.network(
          image!,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
