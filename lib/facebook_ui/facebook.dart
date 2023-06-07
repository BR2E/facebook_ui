import 'package:facebook_ui/models/publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:faker/faker.dart';
import '../icons/custom_icons_icons.dart';
import '../widgets/circular_buttons.dart';
import '../widgets/en_que_estas_pensando.dart';
import '../widgets/_quick_actions.dart';
import '../widgets/publication_item.dart';
import '../widgets/stories.dart';

class Facebook extends StatelessWidget {
  const Facebook({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final publications = <Publication>[];

    for (int i = 0; i < 25; i++) {
      final random = faker.randomGenerator;
      final publication = Publication(
        user: User(
          avatar: faker.image.image(),
          name: faker.person.name(),
        ),
        title: faker.lorem.sentence(),
        date: faker.date.dateTime(),
        imageUrl: faker.image.image(),
        commentsCount: random.integer(5000),
        sharesCounts: random.integer(5000),
        userReactions:
            Reactions.values[random.integer(Reactions.values.length - 1)],
      );
      publications.add(publication);
    }
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SvgPicture.asset(
          'assets/facebook/facebook.svg',
          colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          alignment: Alignment.center,
        ),
        leadingWidth: 120,
        actions: const [
          CircularButtons(
            color: Colors.grey,
            iconData: CustomIcons.search,
          ),
          SizedBox(width: 20),
          CircularButtons(
            color: Color.fromARGB(255, 250, 120, 111),
            iconData: CustomIcons.bell,
          ),
          SizedBox(width: 20),
          CircularButtons(
            color: Color.fromARGB(255, 120, 194, 255),
            iconData: CustomIcons.userFriends,
            notify: true,
          ),
          SizedBox(width: 20),
          CircularButtons(
            color: Colors.blue,
            iconData: CustomIcons.messenger,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          const EnQueEstasPensando(),
          const SizedBox(height: 20),
          const FittedBoxQuickActions(),
          const SizedBox(height: 20),
          const Stories(),
          const SizedBox(height: 30),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => PublicationItem(
              publication: publications[index],
            ),
            itemCount: publications.length,
          ),
        ],
      ),
    );
  }
}
