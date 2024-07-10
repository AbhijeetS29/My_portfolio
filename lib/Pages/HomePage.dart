import 'package:flutter/material.dart';
import 'package:my_portfolio/AboutSection/AboutUsHeading.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/nav_items.dart';
import 'package:my_portfolio/Constants/size.dart';
import 'package:my_portfolio/Skills%20Section/SkillsDesktop.dart';
import 'package:my_portfolio/Skills%20Section/SkillsHeading.dart';
import 'package:my_portfolio/Skills%20Section/SkillsMobile.dart';

import 'package:my_portfolio/project_section/Projects_desktop.dart';
import 'package:my_portfolio/project_section/Projects_mobile.dart';




import 'package:my_portfolio/AboutSection/AboutHeading.dart';
import 'package:my_portfolio/Widgets/divider_desktop.dart';
import 'package:my_portfolio/Widgets/get_in_touch.dart';
import 'package:my_portfolio/Widgets/header_desktop.dart';
import 'package:my_portfolio/Widgets/header_mobile.dart';
import 'dart:js' as js;
import '../AboutSection/AboutMobile.dart';
import '../AboutSection/AboutUsDetailing.dart';


import '../Widgets/main_desktop.dart';
import '../Widgets/main_mobile.dart';
import '../project_section/Project_heading.dart'; // Ensure correct casing here

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.blue,
                ]),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.pink,
                    offset: Offset(-2, 0),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(2, 0),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(15)),
                child: ListView(
                  children: [
                    SizedBox(key: navbarKeys.first),

                    // MAIN
                    if (constraints.maxWidth >= kMedDesktopWidth2)
                      HeaderDesktop(onNavMenuTap: (int navIndex) {
                        scrollToSection(navIndex);
                      })
                    else
                      HeaderMobile(
                        onLogoTap: () {},
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),

                    if (constraints.maxWidth >= kMedDesktopWidth2)
                      const MainDesktop()
                    else
                      MainMobile(
                        onNavMenuTap: (int navIndex) {
                          scrollToSection(navIndex);
                        },
                      ),

                    // SKILLS
                    const DividerDesktop(),

                    Container(
                      key: navbarKeys[1],
                      // Assuming this is correctly defined elsewhere
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 50), // Adjust as needed

                          // Desktop Layout: Skills Panel and About Us
                          if (constraints.maxWidth >= kMedDesktopWidth)
                            Column(
                              children: [
                                const AboutHeading(start: 0, end: 40),
                                // Adjust start and end parameters as needed
                                const SizedBox(height: 20),
                                // Adjust spacing between sections
                                 const AboutMe(),
                                const SkillsHeading(start: 0, end: 30),
                                const SkillsDesktop()
                                // Adjust start and end parameters as needed
                              ],
                            ),

                          // Mobile Layout: Skills Mobile
                          if (constraints.maxWidth < kMedDesktopWidth)
                             Column(
                              children: [
                                AboutHeading(start: 0, end: 40),
                                // Adjust start and end parameters as needed
                                SizedBox(height: 20),
                                // Adjust spacing between sections
                                AboutusMobile(),
                                SkillsHeading(start: 0, end: 30),
                                SkillsMobile()
                                // Adjust start and end parameters as needed
                              ],
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    const DividerDesktop(),


                    const SizedBox(height: 20),

                    // PROJECTS
                    Container(
                      key: navbarKeys[2],
                      width: screenWidth,

                      padding:  const EdgeInsets.fromLTRB(25, 20, 25, 60),


                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // title

                          const PorjectHeading(start: 0, end: 40,),

                          const SizedBox(height: 50),
                          // platforms and skills
                          if (constraints.maxWidth >= kMedDesktopWidth2)
                            const ProjectsDesktop()
                          else
                            const ProjectMobile(),
                        ],
                      ),
                    ),
                    //
                    // const SizedBox(height: 30),
                    //
                    // // CONTACT
                    GetTouch(
                      key: navbarKeys[3],
                    ),
                    // const SizedBox(height: 30),
                    //
                    // // FOOTER
                    // const Footer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      // js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
