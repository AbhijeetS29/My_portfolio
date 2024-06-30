import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Constants/project_utils.dart';
import '../Decoration/style.dart';
import 'Projects_desktop.dart';

class ProjectMid extends StatefulWidget {
  const ProjectMid({super.key});

  @override
  State<ProjectMid> createState() => _ProjectMidState();
}

class _ProjectMidState extends State<ProjectMid> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < workProjectUtils4.length; i++)
                ChangeNotifierProvider(
                  create: (context) => HoverNotifier(),
                  child: Consumer<HoverNotifier>(
                    builder: (context, hoverNotifier, child) {
                      return MouseRegion(
                        onEnter: (_) => hoverNotifier.setHovered(true),
                        onExit: (_) => hoverNotifier.setHovered(false),
                        child: AnimatedScale(
                          scale: hoverNotifier.isHovered ? 1.05 : 1.0,
                          duration: Duration(milliseconds: 500),
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
                                          style: TextStyle(color: CustomColor.maincolor4,fontFamily: 'Inika '),
                                        ),
                                      ),
                                    ),
                                    ProjectCardWidget(
                                      project: workProjectUtils4[i],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),SizedBox(height: 25,),Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < workProjectUtils5.length; i++)
                ChangeNotifierProvider(
                  create: (context) => HoverNotifier(),
                  child: Consumer<HoverNotifier>(
                    builder: (context, hoverNotifier, child) {
                      return MouseRegion(
                        onEnter: (_) => hoverNotifier.setHovered(true),
                        onExit: (_) => hoverNotifier.setHovered(false),
                        child: AnimatedScale(
                          scale: hoverNotifier.isHovered ? 1.05 : 1.0,
                          duration: Duration(milliseconds: 500),
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
                                          style: TextStyle(color: CustomColor.maincolor4,fontFamily: 'Inika '),
                                        ),
                                      ),
                                    ),
                                    ProjectCardWidget(
                                      project: workProjectUtils5[i],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < workProjectUtils6.length; i++)
                ChangeNotifierProvider(
                  create: (context) => HoverNotifier(),
                  child: Consumer<HoverNotifier>(
                    builder: (context, hoverNotifier, child) {
                      return MouseRegion(
                        onEnter: (_) => hoverNotifier.setHovered(true),
                        onExit: (_) => hoverNotifier.setHovered(false),
                        child: AnimatedScale(
                          scale: hoverNotifier.isHovered ? 1.05 : 1.0,
                          duration: Duration(milliseconds: 500),
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
                                          style: TextStyle(color: CustomColor.maincolor4,fontFamily: 'Inika '),
                                        ),
                                      ),
                                    ),
                                    ProjectCardWidget(
                                      project: workProjectUtils6[i],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
          SizedBox(height: 25,)
        ],
      ),
    );
  }
}
