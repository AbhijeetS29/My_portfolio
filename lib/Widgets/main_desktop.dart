import 'package:flutter/material.dart';
import 'package:my_portfolio/Decoration/social_media_list.dart';
import 'package:my_portfolio/IntroTexts/SubTexts.dart';
import 'package:my_portfolio/IntroTexts/description_text.dart';
import 'package:my_portfolio/IntroTexts/headline_text.dart';

import '../Decoration/animated_texts_componenets.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        height: screenHeight / 1.4,
        constraints: const BoxConstraints(
          minHeight: 350.0,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: const SocialMediaIconList(),
            ),
            SizedBox(width: 50,),

               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyPortfolioText(start: 0, end: 50),
                  SubTitles(start: 0, end: 40),
                  AnimatedDescriptionText(start: 0, end: 15,)
                ],
              ),
            SizedBox(width: 50,),

            AnimatedImageContainer()
          ],
        ),
      ),
    );
  }
}
