import 'package:cached_network_image/cached_network_image.dart';
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
    final fromNetwork =
        avatar.startsWith('http://') || avatar.startsWith('https://');
    final image =
        fromNetwork ? CachedNetworkImageProvider(avatar) : AssetImage(avatar);

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
          image: image as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
