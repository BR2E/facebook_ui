import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'facebook_ui/facebook.dart';
import 'icons/custom_icons_icons.dart';
import 'widgets/app_bar_buttons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: SvgPicture.asset(
              'assets/facebook/facebook.svg',
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
              alignment: Alignment.center,
            ),
            leadingWidth: 120,
            actions: const [
              AppBarButton(
                color: Colors.grey,
                iconData: CustomIcons.search,
              ),
              SizedBox(width: 14),
              AppBarButton(
                color: Color.fromARGB(255, 250, 120, 111),
                iconData: CustomIcons.bell,
              ),
              SizedBox(width: 14),
              AppBarButton(
                color: Color.fromARGB(255, 120, 194, 255),
                iconData: CustomIcons.userFriends,
                notify: true,
              ),
              SizedBox(width: 14),
              AppBarButton(
                color: Colors.blue,
                iconData: CustomIcons.messenger,
              ),
              SizedBox(width: 14),
            ],
          ),
          body: const Facebook()),
    );
  }
}
