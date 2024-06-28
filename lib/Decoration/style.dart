import 'package:flutter/material.dart';

import '../Constants/colors.dart';


BoxDecoration kHederDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: CustomColor.maincolor2.withOpacity(0.5), // Shadow color
      spreadRadius: 5, // Spread radius
      blurRadius: 7, // Blur radius
      offset: Offset(0, 3), // Offset in x and y direction
    ),
  ],
  gradient: const LinearGradient(
    colors: [

      CustomColor.maincolor1,
      CustomColor.maincolor2,

    ],

  ),
  borderRadius: BorderRadius.circular(15),
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
      color: CustomColor.maincolor2.withOpacity(0.5), // Shadow color
      spreadRadius: 5, // Spread radius
      blurRadius: 7, // Blur radius
      offset: Offset(0, 3), // Offset in x and y direction
    ),
  ],
  color: CustomColor.maincolor2,


  borderRadius: BorderRadius.circular(30),
);
BoxDecoration kskillsDecoration2 = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: CustomColor.maincolor2.withOpacity(0.5), // Shadow color
      spreadRadius: 5, // Spread radius
      blurRadius: 7, // Blur radius
      offset: Offset(0, 3), // Offset in x and y direction
    ),
  ],
  color: CustomColor.maincolor23,


  borderRadius: BorderRadius.circular(17),
);
