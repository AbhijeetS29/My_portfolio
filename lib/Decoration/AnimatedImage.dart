import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../responsive.dart';
class AnimatedImageContainerP extends StatefulWidget {
  const AnimatedImageContainerP({Key? key, this.height = 250, this.width = 200})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  AnimatedImageContainerPState createState() => AnimatedImageContainerPState();
}
class AnimatedImageContainerPState extends State<AnimatedImageContainerP>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true); // Repeat the animation loop
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 3 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,

                color: bgColor1,

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
                color: bgColor,
              ),
              child: Image.asset(
                'assets/images/main.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
