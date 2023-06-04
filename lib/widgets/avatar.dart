import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatar;
  final double size;
  const Avatar({super.key, required this.avatar, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
        child: Image.asset(
          avatar,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
