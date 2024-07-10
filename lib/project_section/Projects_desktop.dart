import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/project_utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsDesktop extends StatefulWidget {
  const ProjectsDesktop({super.key});

  @override
  State<ProjectsDesktop> createState() => _ProjectsDesktopState();
}

class _ProjectsDesktopState extends State<ProjectsDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Displaying projects in two rows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: AboutMeCard(index: i),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 3; i < workProjectUtils.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: AboutMeCard(index: i),
                        ),
                    ],
                  ),
                ),
              ),
            ],
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
        duration: Duration(milliseconds: 300),
        height: 280,
        width: 300,
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
              spreadRadius: isHovered ? 10 : 2, // Change spread radius on hover
            ),
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              offset: Offset(0, 5),
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
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    workProjectUtils[widget.index].title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    workProjectUtils[widget.index].subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Open Sans',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                                fontSize: 15,
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
    );
  }
}
