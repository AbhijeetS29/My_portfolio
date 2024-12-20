import 'package:flutter/material.dart';

import '../responsive.dart';


class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          'I am an experienced application and web developer with expertise in Flutter and Kotlin.\nI also excel in creating user-friendly designs',
          maxLines: 3,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: 12),
        );
      },
    );
  }
}