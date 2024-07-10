import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/services_utils.dart';
import '../Constants/colors.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < aboutProjectUtils.length; i += 2)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AboutMeCard(index: i),
                  ),
                  const SizedBox(width: 20),
                  if (i + 1 < aboutProjectUtils.length)
                    Expanded(
                      child: AboutMeCard(index: i + 1),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class AboutMeCard extends StatefulWidget {
  final int index;

  const AboutMeCard({required this.index});

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Colors.pinkAccent, Colors.blue],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 15,
              spreadRadius: isHovered ? 10 : 2, // Change spread radius on hover
            ),
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 15,
              spreadRadius: isHovered ? 10 : 2, // Change spread radius on hover
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  aboutProjectUtils[widget.index].image,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(height: 15),
                Text(
                  aboutProjectUtils[widget.index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  aboutProjectUtils[widget.index].subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
