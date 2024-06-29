import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/project_utils.dart';
import 'package:my_portfolio/Decoration/style.dart';

import 'ProjectWidgetDesktop.dart';

class ProjectsDesktop extends StatefulWidget {
  const ProjectsDesktop({super.key});

  @override
  State<ProjectsDesktop> createState() => _ProjectsDesktopState();
}

class _ProjectsDesktopState extends State<ProjectsDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("My Projects",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width:270,
                decoration: kskillsDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: projectdecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Mobile Application",style: TextStyle(color: CustomColor.maincolor2),),
                        ),
                      ),
                      for (int i = 0; i < workProjectUtils.length; i++)
                        ProjectCardWidget(
                          project: workProjectUtils[i],
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

class ProjectCard extends StatelessWidget {
  final String title;
  final ImageProvider image;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 330,
      decoration: kskillsDecoration,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              decoration: projectdecoration,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(color: CustomColor.maincolor2),
                ),
              ),
            ),
            Image(image: image),
          ],
        ),
      ),
    );
  }
}
