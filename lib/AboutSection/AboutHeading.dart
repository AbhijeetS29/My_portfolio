import "package:flutter/material.dart";
import '../Constants/colors.dart';
import '../Constants/skill_items.dart';

class AboutHeading extends StatelessWidget {
  const AboutHeading({super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: end),
      duration: const Duration(milliseconds: 900),
      builder: (context, value, child) {
        return RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 0,
              fontSize: value,
            ),
            children: [
              WidgetSpan(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: const Duration(milliseconds: 200),
                  builder: (context, tweenValue, child) {
                    return  Text(
                      'About',
                      style: TextStyle(
                        fontSize: tweenValue,
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    );
                  },
                ),
              ),
              TextSpan(
                text: ' ',
                style: TextStyle(
                  fontSize: value,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              WidgetSpan(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: const Duration(milliseconds: 200),
                  builder: (context, tweenValue, child) {
                    return ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: <Color>[Colors.pinkAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        'ME',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: tweenValue,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
