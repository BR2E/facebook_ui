import 'package:flutter/material.dart';
import '../widgets/en_que_estas_pensando.dart';

class Facebook extends StatelessWidget {
  const Facebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
      children: const [EnQueEstasPensando()],
    );
  }
}
