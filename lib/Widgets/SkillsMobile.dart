import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/skill_items.dart';
import '../Decoration/style.dart';

class SkillsMobile extends StatefulWidget {
  const SkillsMobile({super.key});

  @override
  State<SkillsMobile> createState() => _SkillsMobileState();
}

class _SkillsMobileState extends State<SkillsMobile> {
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
          color: Color(0xaffffff),
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
                fontFamily: 'Open Sans',
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 60),
            child: Text(
              "My Services",
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 28,
                height: 1.2,
                fontWeight: FontWeight.w400,
                color: CustomColor.whitePrimary,
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
                      "Bringing Your Ideas to Life with Innovative Mobile Solutions",
                    ),
                    SizedBox(height: 30,),
                  HoverContainer2(
                  imagePath: "assets/images/ux.png",
                  title: "UI/UX Design",
                  description:
                  "“Crafting Engaging and Intuitive User Experiences”",
                ),
                    SizedBox(height: 30,),HoverContainer3(
                  imagePath: "assets/images/help.png",
                  title: "Voluntary Work",
                  description:
                  "“Supporting non-profits with my skills and expertise to enhance their impact.”",
                ),
                ],
                ),

          SizedBox(height: 50,),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Wrap(
                spacing: 40.0,
                runSpacing: 40.0,
                children: [
                  for (int i = 0; i < skillItems.length; i++)
                    Chip(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      backgroundColor: CustomColor.bgLight2,
                      label: Text(skillItems[i]["title"]),
                      avatar: Image.asset(skillItems[i]["img"]),
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

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
        _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: kskillsDecoration.copyWith(
          boxShadow: [
            BoxShadow(
              color: CustomColor.scaffoldBg.withOpacity(0.9),
              spreadRadius: 7,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
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
                child: Text("Learn More ->"))
          ],
        ),
      ),
    );
  }
}

class HoverContainer2 extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  const HoverContainer2({super.key, required this.imagePath, required this.title, required this.description});

  @override
  State<HoverContainer2> createState() => _HoverContainer2State();
}

class _HoverContainer2State extends State<HoverContainer2> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
        _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: kskillsDecoration.copyWith(
          boxShadow: [
            BoxShadow(
              color: CustomColor.scaffoldBg.withOpacity(0.9),
              spreadRadius: 7,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
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
                child: Text("Learn More ->"))
          ],
        ),
      ),
    );
  }
}
class HoverContainer3 extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  const HoverContainer3({super.key, required this.imagePath, required this.title, required this.description});

  @override
  State<HoverContainer3> createState() => _HoverContainer3State();
}

class _HoverContainer3State extends State<HoverContainer3> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
        _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: kskillsDecoration.copyWith(
          boxShadow: [
            BoxShadow(
              color: CustomColor.scaffoldBg.withOpacity(0.9),
              spreadRadius: 7,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
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
                child: Text("Learn More ->"))
          ],
        ),
      ),
    );
  }
}


