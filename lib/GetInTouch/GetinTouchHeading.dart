import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ContactsHeading extends StatefulWidget {
  const ContactsHeading({super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  State<ContactsHeading> createState() => _ContactsHeadingState();
}

class _ContactsHeadingState extends State<ContactsHeading> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: widget.start, end: widget.end),
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
                      'Get in ',
                      style: TextStyle(
                        fontSize: tweenValue,
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
                          colors: <Color>[bgColor1,bgColor2],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        'Touch',
                        style: TextStyle(
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
