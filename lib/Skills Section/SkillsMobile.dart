import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../Constants/colors.dart';
import '../Constants/skill_items.dart';
import '../Decoration/style.dart';

class SkillsMobile extends StatefulWidget {
  const SkillsMobile({super.key});

  @override
  State<SkillsMobile> createState() => _SkillsMobileState();
}

class _SkillsMobileState extends State<SkillsMobile> {
<<<<<<< HEAD
  late int tappedIndex;

  @override
  void initState() {
    super.initState();
    tappedIndex = -1; // Initialize to -1 to indicate no tap initially
  }

  void onTap(int index) {
    setState(() {
      tappedIndex = tappedIndex == index ? -1 : index; // Toggle tap
    });
  }

  Widget buildSkillItem(Map skillItem, bool isTapped, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        width: isTapped ? 140 : 70,
        height: 70,
        margin: const EdgeInsets.only(bottom: 20), // Add space between rows
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
            colors: [Colors.pinkAccent, Colors.blue],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 15,
              spreadRadius: 5,
            ),
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: bgColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(skillItem['img'], width: 40, height: 40),
                ),
                if (isTapped)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        skillItem['title'] as String,
                        style: const TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

=======
>>>>>>> parent of 198c43e (almost done)
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      decoration: BoxDecoration(
          color: CustomColor.maincolor3.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 55, left: 55),
            child: Text(
              "-Services",
              style: TextStyle(
                fontFamily: 'Inika',
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: CustomColor.maincolor4,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 60),
            child: Text(
              "My Services",
              style: TextStyle(
                fontFamily: 'Inika',
                fontSize: 28,
                height: 1.2,
                fontWeight: FontWeight.w800,
                color: CustomColor.maincolor4,
                letterSpacing: 1.2,
              ),
            ),
          ),
                SizedBox(height: 30,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HoverContainer(
                      imagePath: "assets/images/app-development.png",
                      title: "App Development",
                      description:
                      "“I am an Experienced application Developer , always at my best for Bringing Your Ideas to Life with Innovative Mobile Solutions”",
                    ),
                    SizedBox(height: 25,),
                    HoverContainer(
                      imagePath: "assets/images/ux.png",
                      title: "UI/UX Design",
                      description:
                      "“I am an Experienced UI/Ux Designer always try to make Friendly designs for each and every user.”",
                    ),
                    SizedBox(height: 25,),HoverContainer(
                      imagePath: "assets/images/help.png",
                      title: "Voluntary Work",
                      description:
                      "“I am an Experienced application Developer , always at my best for Bringing Your Ideas to Life with Innovative Mobile Solutions”",
                    ),
                    SizedBox(height: 25,),
                ],
                ),

          SizedBox(height: 50,),
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 15.0,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < skillItemsM.length; i++)
                            Container(
                              height: 60,
                              decoration: kskillsDecoration2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(skillItemsM[i]['img']),
                                    SizedBox(width: 10),
                                    Text(skillItemsM[i]['title']),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),SizedBox(
                    height: 25,
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 15.0,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < skillItemsM1.length; i++)
                            Container(
                              height: 60,
                              decoration: kskillsDecoration2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(skillItemsM1[i]['img']),
                                    SizedBox(width: 10),
                                    Text(skillItemsM1[i]['title']),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),SizedBox(
                    height: 25,
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 15.0,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < skillItemsM2.length; i++)
                            Container(
                              height: 60,
                              decoration: kskillsDecoration2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(skillItemsM2[i]['img']),
                                    SizedBox(width: 10),
                                    Text(skillItemsM2[i]['title']),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),SizedBox(
                    height: 25,
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 15.0,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < skillItemsM3.length; i++)
                            Container(
                              height: 60,
                              decoration: kskillsDecoration2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(skillItemsM3[i]['img']),
                                    SizedBox(width: 10),
                                    Text(skillItemsM3[i]['title']),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
class HoverContainer extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;

  const HoverContainer({
    required this.imagePath,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuad,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onClick() {
    _controller.forward(from: 0).then((_) {
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -_animation.value),
              child: Container(
                decoration: kskillsDecoration,
                width: 250,
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.imagePath,
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 25,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.whitePrimary,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 13,
                          height: 1.2,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 45,),
                    ElevatedButton(
                        onPressed: ()
                        {
                        },
                        style: ElevatedButton.styleFrom(
                          primary: CustomColor.whitePrimary, // Button color
                          onPrimary: CustomColor.scaffoldBg, // Text color
                          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 5, // Shadow depth
                        ),
                        child: Text("Reach out",style: TextStyle(color: CustomColor.maincolor4),))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

