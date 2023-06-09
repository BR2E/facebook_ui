import 'package:flutter/material.dart';

class CircularButtons extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final bool notify;

  const CircularButtons({
    super.key,
    required this.color,
    required this.iconData,
    this.notify = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 15,
            ),
          ),
          if (notify)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
