import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/services_utils.dart';
import '../Constants/colors.dart';

class AboutusMobile extends StatefulWidget {
  const AboutusMobile({Key? key}) : super(key: key);

  @override
  State<AboutusMobile> createState() => _AboutusMobileState();
}

class _AboutusMobileState extends State<AboutusMobile> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < aboutProjectUtils.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: AboutMeCard(
                index: i,
                isSelected: selectedIndex == i,
                onCardTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}

class AboutMeCard extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onCardTap;

  const AboutMeCard({
    required this.index,
    required this.isSelected,
    required this.onCardTap,
  });

  @override
  _AboutMeCardState createState() => _AboutMeCardState();
}

class _AboutMeCardState extends State<AboutMeCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onCardTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 200,
          width: double.infinity,
          transform: widget.isSelected
              ? (Matrix4.identity()
            ..rotateZ(-0.05)
            ..translate(-20.0, 10.0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Colors.pinkAccent, Colors.blue],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.3),
                offset: Offset(0, 5),
                blurRadius: 15,
                spreadRadius: isHovered ? 10 : 2,
              ),
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                offset: Offset(0, 5),
                blurRadius: 15,
                spreadRadius: isHovered ? 10 : 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: widget.isSelected ? Offset(-5, 5) : Offset.zero,
                    child: Icon(
                      aboutProjectUtils[widget.index].image,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Transform.translate(
                    offset: widget.isSelected ? Offset(-5, 5) : Offset.zero,
                    child: Text(
                      aboutProjectUtils[widget.index].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Transform.translate(
                    offset: widget.isSelected ? Offset(-5, 5) : Offset.zero,
                    child: Text(
                      aboutProjectUtils[widget.index].subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
