import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import '../Constants/skill_items.dart';

class SkillsMobile extends StatefulWidget {
  const SkillsMobile({super.key});

  @override
  State<SkillsMobile> createState() => _SkillsMobileState();
}

class _SkillsMobileState extends State<SkillsMobile> {
  // late int tappedIndex;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   tappedIndex = -1; // Initialize to -1 to indicate no tap initially
  // }
  //
  // void onTap(int index) {
  //   setState(() {
  //     tappedIndex = tappedIndex == index ? -1 : index; // Toggle tap
  //   });
  // }

  Widget buildSkillItem(Map skillItem, bool isTapped, int index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(

              shape: BoxShape.circle,
              color: bgColor1,
              boxShadow: const [
                BoxShadow(
                  color: bgColor1,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    skillItem['img'],
                    width: 50,  // Adjust width and height as needed
                    height: 50,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),  // Space between image and text
          Text(
            skillItem['title'],
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color:Colors.white,  // Change color if tapped
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Combine skillItems and skillItems1 into a single list
    List<Map> combinedSkills = [...skillItems, ...skillItems1];

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          for (int i = 0; i < combinedSkills.length; i += 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildSkillItem(combinedSkills[i], false, i),
                if (i + 1 < combinedSkills.length)
                  buildSkillItem(combinedSkills[i + 1], false, i + 1),
              ],
            ),
        ],
      ),
    );
  }
}

// GestureDetector(
// onTap: () => onTap(index),
// child: AnimatedContainer(
// duration: Duration(milliseconds: 800),
// width: isTapped ? 200 : 90,
// height: 80,
// margin: EdgeInsets.only(bottom: 20), // Add space between rows
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(40),
// gradient: const LinearGradient(
// colors: [Colors.pinkAccent, Colors.blue],
// ),
// boxShadow: [
// BoxShadow(
// color: Colors.pink.withOpacity(0.3),
// offset: Offset(0, 5),
// blurRadius: 15,
// spreadRadius: 5,
// ),
// BoxShadow(
// color: Colors.blue.withOpacity(0.3),
// offset: Offset(0, 5),
// blurRadius: 15,
// spreadRadius: 5,
// ),
// ],
// ),
// child: Padding(
// padding: const EdgeInsets.all(4.0),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(40),
// color: bgColor,
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Image.asset(skillItem['img'], width: 60, height: 60),
// ),
// if (isTapped)
// Expanded(
// child: Padding(
// padding: const EdgeInsets.only(left: 10.0),
// child: Text(
// skillItem['title'] as String,
// style: TextStyle(
// fontFamily: 'Open Sans',
// fontSize: 16,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// );