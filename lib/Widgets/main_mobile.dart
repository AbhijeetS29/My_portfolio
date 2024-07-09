import 'package:flutter/material.dart';
import 'package:my_portfolio/Decoration/animated_texts_componenets.dart';
import 'package:my_portfolio/IntroTexts/SubTexts.dart';
import 'package:my_portfolio/IntroTexts/description_text.dart';
import 'package:my_portfolio/IntroTexts/headline_text.dart';

import '../Constants/colors.dart';
import '../Constants/nav_items.dart'; // Assuming you have defined navTitles in this file
import '../Decoration/AnimatedImage.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Navigation Buttons

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < navTitles.length; i++)
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 900 + (i * 200)),
                    builder: (context, double value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * -20),
                          child: TextButton(
                            onPressed: () {
                              onNavMenuTap(i);
                            },
                            child: Text(
                              navTitles[i],
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w500,
                                color: CustomColor.whitePrimary,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          SizedBox(height: 40,),

          // Centered Animated Image
          Center(
            child: AnimatedImageContainerP(),
          ),

          // Text Descriptions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPortfolioText(start: 0, end: 40),
                SizedBox(height: 5),
                SubTitles(start: 0, end: 30),
                SizedBox(height: 5),
                AnimatedDescriptionText(start: 0, end: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
