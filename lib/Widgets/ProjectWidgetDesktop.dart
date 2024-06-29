import 'package:flutter/material.dart';
import 'package:my_portfolio/Decoration/style.dart';
import 'dart:js' as js;

import '../Constants/colors.dart';
import '../Constants/project_utils.dart';
class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: kskillsDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            project.image,
            height: 90,
            width: 90,
            fit: BoxFit.cover,
          ),
          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 2, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                fontFamily: 'Inika',
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: CustomColor.maincolor3,
              ),
            ),
          ),
          // subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.maincolor1,
              ),
            ),
          ),
          // footer,
SizedBox(height: 15,),
          Container(
            decoration: projectdecoration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("View Project",style: TextStyle(color: CustomColor.maincolor4),),
            ),
          ),
        ],
      ),
    );
  }
}
