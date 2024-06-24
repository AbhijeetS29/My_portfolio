import 'package:flutter/material.dart';
import 'package:my_portfolio/Decoration/style.dart';
import '../Constants/colors.dart';

class SkillsPanelDesktop extends StatelessWidget {
  const SkillsPanelDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Container(
      width: double.infinity,
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xaffffff),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverContainer(
                  imagePath: "assets/images/app-development.png",
                  title: "App Development",
                  description:
                  "Bringing Your Ideas to Life with Innovative Mobile Solutions",
                ),
              ],
            ),
          ),
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
        duration: const Duration(milliseconds: 200),
        transform:
        _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: kskillsDecoration.copyWith(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
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
