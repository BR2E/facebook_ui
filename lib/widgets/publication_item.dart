import 'package:facebook_ui/models/publication.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'avatar.dart';

class PublicationItem extends StatelessWidget {
  final Publication publication;

  const PublicationItem({
    super.key,
    required this.publication,
  });

  String _getReactionsPath(Reactions reaction) {
    switch (reaction) {
      case Reactions.like:
        return 'assets/emojis/like.svg';

      case Reactions.heart:
        return 'assets/emojis/heart.svg';

      case Reactions.laughing:
        return 'assets/emojis/laughing.svg';

      case Reactions.sad:
        return 'assets/emojis/sad.svg';

      case Reactions.shocked:
        return 'assets/emojis/shocked.svg';

      case Reactions.angrey:
        return 'assets/emojis/angry.svg';
    }
  }

  String _formatCount(int number) {
    if (number >= 1000) {
      return (number / 1000).toStringAsFixed(1);
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(
      color: Colors.black38,
      overflow: TextOverflow.ellipsis,
    );

    const reactions = Reactions.values;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 6,
            color: Colors.grey.withOpacity(.2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Avatar(
                  avatar: publication.user.avatar,
                  size: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    publication.user.name,
                    style: style,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  timeago.format(publication.date),
                  style: style,
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              height: 200,
              width: double.infinity,
              imageUrl: publication.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              publication.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(reactions.length, (index) {
                      final reactionIsActive =
                          publication.userReactions == reactions[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              _getReactionsPath(reactions[index]),
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(height: 4),
                            Icon(
                              Icons.circle,
                              size: 6,
                              color: reactionIsActive
                                  ? Colors.redAccent
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(width: 10),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          Text(
                            '${_formatCount(publication.commentsCount)}k Comments',
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${_formatCount(publication.sharesCounts)}k Shares',
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
