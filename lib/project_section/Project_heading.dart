import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';

class PorjectHeading extends StatefulWidget {
  const PorjectHeading({super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  State<PorjectHeading> createState() => _PorjectHeadingState();
}

class _PorjectHeadingState extends State<PorjectHeading> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: widget.end),
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
                      'My',
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
                          colors: <Color>[bgColor1, bgColor2],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        'Projects',
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
