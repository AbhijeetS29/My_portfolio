import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

import '../Constants/colors.dart';
import '../Constants/project_utils.dart';
import '../Decoration/style.dart';

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
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < workProjectUtils.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: AboutMeCard(
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
          duration: Duration(milliseconds: 500),

          width: double.infinity,
          transform: Matrix4.identity()
            ..translate(
              // Offset based on selection
              widget.isSelected ? -20.0 : 0.0,
              widget.isSelected ? 10.0 : 0.0,
            )
            ..rotateZ(widget.isSelected ? -0.05 : 0.0),
          // Rotate if selected
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
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      workProjectUtils[widget.index].title,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    workProjectUtils[widget.index].subtitle,
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
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
                              style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: CupertinoColors.activeOrange),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
