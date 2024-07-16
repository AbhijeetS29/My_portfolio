import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/GetInTouch/Animated.dart';
import 'package:my_portfolio/IntroTexts/headline_text.dart';

class ContactCenter extends StatefulWidget {
  const ContactCenter({super.key});

  @override
  State<ContactCenter> createState() => _ContactCenterState();
}

class _ContactCenterState extends State<ContactCenter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              MyPortfolioText(start: 0, end: 15),
            ],
          ),
          Container(
            width: 1,
            decoration: BoxDecoration(
              color: bgColor1,
              borderRadius: BorderRadius.circular(5)
            ),
          ),
          AnimatedContainer1()
        ],
      ),
    );
  }
}
