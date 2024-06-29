import 'package:flutter/material.dart';

import '../Constants/colors.dart';



class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 30.0,
        ),

        width: double.maxFinite,
        constraints: const BoxConstraints(
          minHeight: 560.0,
        ),
        decoration: BoxDecoration(
          // color: Color(0x1affffff),
          borderRadius: BorderRadius.circular(20)
        ),


        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // avatar img
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(colors: [
                  CustomColor.scaffoldBg.withOpacity(0.2),
                  CustomColor.scaffoldBg.withOpacity(0.2),
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/mainpic1.png",
                    width: screenWidth/3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // intro message
             Text(
              "Hey! I'm",
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: CustomColor.maincolor4,
              ),
            ),Text(
              "ABHIJEET SINGH",
              style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.maincolor4,
              ),
            ),Text(
              "An Application Developer",
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: CustomColor.maincolor4,
              ),
            ),
            const SizedBox(height: 15),
            // contact btn
            SizedBox(
              width: 190.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: CustomColor.maincolor4, // Button color
                  onPrimary: CustomColor.maincolor3, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5, // Shadow depth
                ),
                child: const Text("Get in touch",style: TextStyle(
                  fontSize: 18,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
