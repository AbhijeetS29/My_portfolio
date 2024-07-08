import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/colors.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final List<Widget> socialMediaIcons = [
      SvgPicture.asset('assets/icons/twitter.svg', color: Colors.white),
      SvgPicture.asset('assets/icons/linkedin.svg', color: Colors.white),
      SvgPicture.asset('assets/icons/github.svg', color: Colors.white),

    ];

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 700),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Column(
            children: [
              const Spacer(),
              RotatedBox(
                quarterTurns: -3,
                child: Opacity(
                  opacity: value,
                  child: Text(
                    'Follow Me',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.06,
                width: 3,
                margin: const EdgeInsets.symmetric(vertical: defaultPadding * 0.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultPadding),
                ),
              ),
              Column(
                children: List.generate(socialMediaIcons.length, (i) {
                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 900 + (i * 200)),
                    builder: (context, double value, child) {
                      return Opacity(
                        opacity: value.clamp(0.0, 1.0), // Ensure opacity is within valid range
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * -20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: socialMediaIcons[i],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}

