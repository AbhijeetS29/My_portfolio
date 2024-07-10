import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: <Color>[Colors.pink, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        child: const Text(
          "A.S",
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.bold,
            color: Colors.white, // This color should be white to make the gradient visible
          ),
        ),
      ),
    );
  }
}
