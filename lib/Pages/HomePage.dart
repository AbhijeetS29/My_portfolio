import 'package:flutter/material.dart';
import 'package:my_portfolio/AboutSection/AboutUsHeading.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/nav_items.dart';
import 'package:my_portfolio/Constants/size.dart';
import 'package:my_portfolio/GetInTouch/GetinTouchHeading.dart';
import 'package:my_portfolio/Skills%20Section/SkillsDesktop.dart';
import 'package:my_portfolio/Skills%20Section/SkillsHeading.dart';
import 'package:my_portfolio/Skills%20Section/SkillsMobile.dart';

import 'package:my_portfolio/project_section/Projects_desktop.dart';
import 'package:my_portfolio/project_section/Projects_mobile.dart';

import 'package:my_portfolio/AboutSection/AboutHeading.dart';
import 'package:my_portfolio/Widgets/divider_desktop.dart';
import 'package:my_portfolio/GetInTouch/get_in_touch.dart';
import 'package:my_portfolio/Widgets/header_desktop.dart';
import 'package:my_portfolio/Widgets/header_mobile.dart';
import 'dart:js' as js;
import '../AboutSection/AboutUsDesktop.dart';
import '../AboutSection/AboutusMobile.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initial scroll to top to ensure widgets are rendered
      scrollController.jumpTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(15)),
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(key: navbarKeys.first),
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
                  const DividerDesktop(),
                  Container(
                    key: navbarKeys[1],
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 50), // Adjust as needed
              
                        // Desktop Layout: Skills Panel and About Us
                        if (constraints.maxWidth >= kMedDesktopWidth)
                          const Column(
                            children: [
                              AboutHeading(start: 0, end: 40),
                              SizedBox(height: 20),
                              AboutMe(),
                              SkillsHeading(start: 0, end: 30),
                              SkillsDesktop()
                            ],
                          ),
              
                        // Mobile Layout: Skills Mobile
                        if (constraints.maxWidth < kMedDesktopWidth)
                          const Column(
                            children: [
                              AboutHeading(start: 0, end: 40),
                              SizedBox(height: 20),
                              // Adjust spacing between sections
                              AboutUsMobile(),
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
              
                  // Projects
                  Container(
                    key: navbarKeys[2],
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // title
                        const PorjectHeading(
                          start: 0,
                          end: 40,
                        ),
                        const SizedBox(height: 50),
                        // platforms and skills
                        if (constraints.maxWidth >= kMedDesktopWidth2)
                          const ProjectsDesktop()
                        else
                          const ProjectMobile(),
                      ],
                    ),
                  ),
                  const DividerDesktop(),
                  Container(
                    key: navbarKeys[3],
                    width: screenWidth!,
                    child: Column(
                      children: [
                        GetTouch(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (navIndex == 4) {
        // open a blog page
        // js.context.callMethod('open', [SnsLinks.blog]);
        return;
      }

      final key = navbarKeys[navIndex];
      final context = key.currentContext;

      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // If context is null, schedule another attempt
        Future.delayed(const Duration(milliseconds: 100), () {
          final retryContext = key.currentContext;
          if (retryContext != null) {
            Scrollable.ensureVisible(
              retryContext,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            print('Context is still null for index $navIndex');
          }
        });
      }
    });
  }
}
