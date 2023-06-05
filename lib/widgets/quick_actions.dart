import 'package:flutter/material.dart';
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
        alignment: Alignment.center,
        width: 100,
        color: color.withOpacity(.2),
        child: Row(
          children: [
            CircularButtons(
              color: color,
              iconData: icon,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(text)
          ],
        ));
  }
}
