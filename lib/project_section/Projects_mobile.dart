import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

import '../Constants/colors.dart';
import '../Constants/project_utils.dart';

class ProjectMobile extends StatefulWidget {
  const ProjectMobile({Key? key}) : super(key: key);

  @override
  State<ProjectMobile> createState() => _ProjectMobileState();
}

class _ProjectMobileState extends State<ProjectMobile> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < workProjectUtils.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ProjectCard(
                index: i,
                isSelected: selectedIndex == i,
                onCardTap: () {
                  setState(() {
                    // Toggle selection or reset to null if already selected
                    selectedIndex = selectedIndex == i ? null : i;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onCardTap;

  const ProjectCard({
    required this.index,
    required this.isSelected,
    required this.onCardTap,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
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
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: 310, // Adjusted height for selected state
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
                blurRadius: 15,
                spreadRadius: isHovered || widget.isSelected ? 10 : 2,
              ),
              BoxShadow(
                color: bgColor1.withOpacity(0.3),
                offset: const Offset(0, 5),
                blurRadius: 15,
                spreadRadius: isHovered || widget.isSelected ? 10 : 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(30)
              ),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    workProjectUtils[widget.index].title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    workProjectUtils[widget.index].subtitle,
                    style: const TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          workProjectUtils[widget.index].language,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () async {
                            var url = workProjectUtils[widget.index].webLink.toString();
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text(
                            workProjectUtils[widget.index].view,
                            style: const TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ],
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
