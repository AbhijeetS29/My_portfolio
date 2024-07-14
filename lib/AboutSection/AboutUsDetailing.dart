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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    // Toggle selection state
                    if (selectedIndex == i) {
                      selectedIndex = null; // Deselect if tapped again
                    } else {
                      selectedIndex = i;
                    }
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}

class AboutMeCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onCardTap;

  const AboutMeCard({
    required this.index,
    required this.isSelected,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        // height: isSelected ? 260 : 240, // Adjusted height for selected state
        width: double.infinity,
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
              spreadRadius: isSelected ? 6 : 2,
            ),
            BoxShadow(
              color: bgColor1.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: isSelected ? 6 : 2,
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
                    aboutProjectUtils[index].image,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      aboutProjectUtils[index].title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      aboutProjectUtils[index].subtitle,
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
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
