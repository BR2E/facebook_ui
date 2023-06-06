import 'package:facebook_ui/models/story.dart';
import 'package:flutter/material.dart';
import 'avatar.dart';

final _stories = [
  Story(
      img: 'assets/wallpapers/1.jpeg',
      avatar: 'assets/users/1.jpg',
      username: 'Laura Leporc'),
  Story(
      img: 'assets/wallpapers/2.jpeg',
      avatar: 'assets/users/2.jpg',
      username: 'Alix Luca'),
  Story(
      img: 'assets/wallpapers/3.jpeg',
      avatar: 'assets/users/3.jpg',
      username: 'Moa Rotenb'),
  Story(
      img: 'assets/wallpapers/4.jpeg',
      avatar: 'assets/users/4.jpg',
      username: 'Luice Polis'),
  Story(
      img: 'assets/wallpapers/5.jpeg',
      avatar: 'assets/users/5.jpg',
      username: 'Daniel Lopez'),
];

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final story = _stories[index];
          return ItemsListHistories(story: story);
        },
        itemCount: _stories.length,
      ),
    );
  }
}

class ItemsListHistories extends StatelessWidget {
  const ItemsListHistories({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 100,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0,
                  bottom: 20,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(story.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Avatar(
                    avatar: story.avatar,
                    size: 50,
                    borderWidth: 3,
                  ),
                ),
              ],
            ),
          ),
          Text(
            story.username,
            style: const TextStyle(color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
