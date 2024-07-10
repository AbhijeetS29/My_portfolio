import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/project_utils.dart';
import 'package:my_portfolio/Decoration/style.dart';
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
              for (int i = 0; i < workProjectUtils.length; i++)
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
                                      project: workProjectUtils[i],
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
          SizedBox(height: 25,),Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < workProjectUtils1.length; i++)
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
                                      project: workProjectUtils1[i],
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

class HoverNotifier extends ChangeNotifier {
  bool _isHovered = false;

  bool get isHovered => _isHovered;

  void setHovered(bool value) {
    _isHovered = value;
    notifyListeners();
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
                    borderRadius: BorderRadius.circular(50)
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
                    onPressed: () async {
                      var url = project.webLink;
                      if (await canLaunch(url!)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: CustomColor.whitePrimary,
                      onPrimary: CustomColor.whitePrimary,// Button color, // Text color
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5, // Shadow depth
                    ),
                    child: Text("View Project",style: TextStyle(color: CustomColor.maincolor4),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
