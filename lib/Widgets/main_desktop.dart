import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        height: screenHeight / 1.3,
        constraints: const BoxConstraints(
          minHeight: 350.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xaffffff),
              borderRadius: BorderRadius.circular(10)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // intro message
                Align(
                 alignment: Alignment.topLeft
                  ,child:  Text(
                    " Hey! I'm ",
                    style: TextStyle(
                      fontSize: 25,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: CustomColor.maincolor4,
                    ),
                  ),
                ),Text(
                  "ABHIJEET SINGH",
                  style: TextStyle(
                    fontSize: 25,
                    height: 1.5,
                    fontWeight: FontWeight.w800,
                    color: CustomColor.maincolor4,
                  ),
                ),Text(
                  "An Application Developer",
                  style: TextStyle(
                    fontSize: 25,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.maincolor4,
                  ),
                ),
                const SizedBox(height: 15),
                // contact btn
                SizedBox(
                  width: 250.0,
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
                    child: const Text("Curriculum vitae",style: TextStyle(
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),),
                  ),
                )
              ],
            ),
            // avatar img
            Image.asset(
              "assets/images/mainpic1.png",
              width: screenWidth / 3,
            ),
          ],
        ),
      ),
    );
  }
}
