import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/nav_items.dart';
import 'package:my_portfolio/Constants/size.dart';
import 'package:my_portfolio/Widgets/Project_Mid_RAnge.dart';
import 'package:my_portfolio/Widgets/Projects_desktop.dart';
import 'package:my_portfolio/Widgets/Projects_mobile.dart';
import 'package:my_portfolio/Widgets/SkillsDesktop.dart';
import 'package:my_portfolio/Widgets/divider_desktop.dart';
import 'package:my_portfolio/Widgets/get_in_touch.dart';
import 'package:my_portfolio/Widgets/header_desktop.dart';
import 'package:my_portfolio/Widgets/header_mobile.dart';
import 'dart:js' as js;
import '../Constants/sns_links.dart';
import '../Decoration/style.dart';
import '../Widgets/SkillsMobile.dart';
import '../Widgets/drawerM.dart';
import '../Widgets/main_desktop.dart';
import '../Widgets/main_mobile.dart';

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
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
          scaffoldKey.currentState?.closeEndDrawer();
          scrollToSection(navIndex);
        }),
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
    color: bgColor,
  borderRadius: BorderRadius.circular(15)
),

                child: Column(
                  children: [
                    SizedBox(key: navbarKeys.first),

                    // MAIN
                    if (constraints.maxWidth >= kMinDesktopWidth)
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

                    if (constraints.maxWidth >= kMinDesktopWidth)
                      const MainDesktop()
                    else
                      const MainMobile(),

                    // SKILLS
                    DividerDesktop(),

                    Container(
                      key: navbarKeys[1],
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // title
                          const SizedBox(height: 50),
                          // platforms and skills
                          if (constraints.maxWidth >= kMedDesktopWidth)
                            const SkillsPanelDesktop()
                          else
                            const SkillsMobile(),
                        ],
                      ),
                    ),


                    const SizedBox(height: 20),

                    // PROJECTS
                    Container(
                      key: navbarKeys[2],
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // title
                          const SizedBox(height: 50),
                          // platforms and skills
                          if (constraints.maxWidth >= kMedDesktopWidth2)
                            const ProjectsDesktop()
                            else if(constraints.maxWidth >= kMedDesktopWidth)
                              const ProjectMid()
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
      js.context.callMethod('open', [SnsLinks.blog]);
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
