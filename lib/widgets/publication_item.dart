import 'package:facebook_ui/models/publication.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'avatar.dart';

class PublicationItem extends StatelessWidget {
  final Publication publication;

  const PublicationItem({
    super.key,
    required this.publication,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(
      color: Colors.black38,
      overflow: TextOverflow.ellipsis,
    );
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Avatar(
                  avatar: 'assets/users/1.jpg',
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(publication.user.name, style: style),
                const Spacer(),
                Text(timeago.format(publication.date), style: style),
              ],
            ),
          ),
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            imageUrl: publication.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              publication.title,
            ),
          ),
        ],
      ),
    );
  }
}
