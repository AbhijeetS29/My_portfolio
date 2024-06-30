import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../Constants/colors.dart';
import '../Constants/project_utils.dart';
import '../Decoration/style.dart';

class ProjectMobile extends StatelessWidget {
  const ProjectMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: Text(
              "My Projects",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'Inika',
                color: CustomColor.maincolor4,
              ),
            ),
          ),
          SizedBox(height: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < workProjectUtils3.length; i++)
                ProjectContainer(
                  project: workProjectUtils3[i],
                ),
            ],
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

class ProjectContainer extends StatefulWidget {
  final ProjectUtils project;

  const ProjectContainer({super.key, required this.project});

  @override
  _ProjectContainerState createState() => _ProjectContainerState();
}

class _ProjectContainerState extends State<ProjectContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuad,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onClick() {
    _controller.forward(from: 0).then((_) {
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -_animation.value * math.sin(_controller.value * math.pi)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 270,
                height: 390,
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
                          child: Text(
                            "Mobile Application",
                            style: TextStyle(
                              color: CustomColor.maincolor4,
                              fontFamily: 'Inika ',
                            ),
                          ),
                        ),
                      ),
                      ProjectCardWidget(
                        project: widget.project,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kskillsDecoration,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            // footer,
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: CustomColor.whitePrimary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      project.language,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: CustomColor.whitePrimary,
                    onPrimary: CustomColor.whitePrimary, // Button color, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5, // Shadow depth
                  ),
                  child: Text(
                    "View Project",
                    style: TextStyle(color: CustomColor.maincolor4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
