import 'package:flutter/material.dart';

import '../Constants/colors.dart';


BoxDecoration kHederDecoration = BoxDecoration(
  gradient: const LinearGradient(
    colors: [

      CustomColor.maincolor1,
      CustomColor.bgLight1,

    ],
  ),
  borderRadius: BorderRadius.circular(100),
);
BoxDecoration kmainDecoration = BoxDecoration(
  gradient: const LinearGradient(
    colors: [

      CustomColor.bgLight1,
      CustomColor.bgLight1,

    ],
  ),
  borderRadius: BorderRadius.circular(25),
);
BoxDecoration kskillsDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: CustomColor.scaffoldBg.withOpacity(0.5), // Shadow color
      spreadRadius: 5, // Spread radius
      blurRadius: 7, // Blur radius
      offset: Offset(0, 3), // Offset in x and y direction
    ),
  ],
  color: CustomColor.maincolor2,


  borderRadius: BorderRadius.circular(180),
);
