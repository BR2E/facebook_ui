import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatar;
  final double size;
  final double borderWidth;
  const Avatar(
      {super.key,
      required this.avatar,
      required this.size,
      this.borderWidth = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth,
          color: Colors.white,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(avatar),
        ),
      ),
    );
  }
}
