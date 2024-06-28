import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/nav_items.dart';
import 'package:my_portfolio/Constants/size.dart';
import 'package:my_portfolio/Widgets/SkillsDesktop.dart';
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
        backgroundColor: CustomColor.maincolor1,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
          scaffoldKey.currentState?.closeEndDrawer();
          scrollToSection(navIndex);
        }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
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


              // const SizedBox(height: 30),
              //
              // // PROJECTS
              // ProjectsSection(
              //   key: navbarKeys[2],
              // ),
              //
              // const SizedBox(height: 30),
              //
              // // CONTACT
              // ContactSection(
              //   key: navbarKeys[3],
              // ),
              // const SizedBox(height: 30),
              //
              // // FOOTER
              // const Footer(),
            ],
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
