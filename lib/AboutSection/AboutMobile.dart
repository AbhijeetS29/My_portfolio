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
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle selection
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isSelected ? 220 : 200, // Adjusted height for selected state
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [bgColor1, bgColor1],
          ),
          boxShadow: [
            BoxShadow(
              color: bgColor1.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: isSelected ? 6 : 1, // Change spread radius on selection
            ),
            BoxShadow(
              color: bgColor1.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: isSelected ? 6 : 1, // Change spread radius on selection
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    aboutProjectUtils[widget.index].image,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    aboutProjectUtils[widget.index].title,
                    style: const TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    aboutProjectUtils[widget.index].subtitle,
                    style:  const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
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
