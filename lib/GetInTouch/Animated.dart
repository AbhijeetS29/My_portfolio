import 'package:flutter/material.dart';
import 'package:my_portfolio/IntroTexts/headline_text.dart';

import '../Constants/colors.dart';
import '../responsive.dart';

class AnimatedContainer1 extends StatefulWidget {
  const AnimatedContainer1({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  AnimatedContainer1State createState() => AnimatedContainer1State();
}
class AnimatedContainer1State extends State<AnimatedContainer1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true); // Repeat the animation loop
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final value = _controller.value;
          return Transform.translate(
            offset: Offset(0, 2 * value), // Move the container up and down
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(defaultPadding / 4),
              decoration: BoxDecoration(
                color: bgColor1,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: bgColor1,
                    offset: Offset(-2, 0),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/main2.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
