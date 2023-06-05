import 'package:flutter/material.dart';
import '../icons/custom_icons_icons.dart';
import 'circular_buttons.dart';

class QuickActions extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  const QuickActions(
      {super.key, required this.color, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color.withOpacity(.1),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircularButtons(
              color: color,
              iconData: icon,
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(text),
            ),
          ],
        ));
  }
}

class FittedBoxQuickActions extends StatelessWidget {
  const FittedBoxQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: const [
          QuickActions(
            color: Color(0xFF56FC71),
            icon: CustomIcons.photos,
            text: 'Gallery',
          ),
          SizedBox(width: 20),
          QuickActions(
            color: Colors.blue,
            icon: CustomIcons.userFriends,
            text: 'Tag friends',
          ),
          SizedBox(width: 20),
          QuickActions(
            color: Color(0xFFFF6868),
            icon: CustomIcons.videoCamera,
            text: 'Live',
          ),
        ],
      ),
    );
  }
}
