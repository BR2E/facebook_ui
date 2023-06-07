class Publication {
  final User user;
  final String title;
  final DateTime date;
  final String imageUrl;
  final int commentsCount;
  final int sharesCounts;
  final Reactions userReactions;

  Publication({
    required this.user,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.commentsCount,
    required this.sharesCounts,
    required this.userReactions,
  });
}

class User {
  final String avatar;
  final String name;

  User({
    required this.avatar,
    required this.name,
  });
}

enum Reactions {
  like,
  heart,
  laughing,
  sad,
  angrey,
  shocked,
}
