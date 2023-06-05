import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../icons/custom_icons_icons.dart';
import '../widgets/circular_buttons.dart';
import '../widgets/en_que_estas_pensando.dart';
import '../widgets/_quick_actions.dart';
import '../widgets/stories.dart';

class Facebook extends StatelessWidget {
  const Facebook({super.key});

  @override
  Widget build(BuildContext context) {
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
        children: const [
          SizedBox(height: 10),
          EnQueEstasPensando(),
          SizedBox(height: 20),
          FittedBoxQuickActions(),
          SizedBox(height: 20),
          Stories(),
        ],
      ),
    );
  }
}
