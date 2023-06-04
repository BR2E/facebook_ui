import 'package:flutter/material.dart';
import 'avatar.dart';

class EnQueEstasPensando extends StatelessWidget {
  const EnQueEstasPensando({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Avatar(avatar: 'assets/users/1.jpg', size: 60),
        SizedBox(width: 20),
        Text(
          'En que estas pensando ?',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            backgroundColor: Color.fromRGBO(158, 158, 158, .1),
          ),
        )
      ],
    );
  }
}
