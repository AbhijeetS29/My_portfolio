import 'package:flutter/material.dart';
import 'package:my_portfolio/Decoration/style.dart';
import '../Constants/colors.dart';
import '../Constants/skill_items.dart';

class SkillsPanelDesktop extends StatelessWidget {
  const SkillsPanelDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Container(

      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      decoration: BoxDecoration(
        color: CustomColor.maincolor3.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Padding(
            padding: EdgeInsets.only(top: 25, left: 60),
            child: Text(
              "My Services",
              style: TextStyle(
                fontFamily: 'Inika',
                fontSize: 28,
                height: 1.2,
                fontWeight: FontWeight.w800,
                color: CustomColor.maincolor4,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HoverContainer(
                  imagePath: "assets/images/app-development.png",
                  title: "App Development",
                  description:
                  "“I am an Experienced application Developer , always at my best for Bringing Your Ideas to Life with Innovative Mobile Solutions”",
                ),HoverContainer2(
                  imagePath: "assets/images/ux.png",
                  title: "UI/UX Design",
                  description:
                  "“I am an Experienced UI/Ux Designer always try to make Friendly designs for each and every user.”",
                ),HoverContainer3(
                  imagePath: "assets/images/help.png",
                  title: "Voluntary Work",
                  description:
                  "“I am an Experienced application Developer , always at my best for Bringing Your Ideas to Life with Innovative Mobile Solutions”",
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 15.0,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < skillItems.length; i++)
                            Container(
                              height: 60,
                              decoration: kskillsDecoration2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(skillItems[i]['img']),
                                    SizedBox(width: 10),
                                    Text(skillItems[i]['title']),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),SizedBox(
                    height: 25,
                  ),Row(
                    children: [
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 15.0,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < skillItems.length; i++)
                            Container(
                              height: 60,
                              decoration: kskillsDecoration2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(skillItems1[i]['img']),
                                    SizedBox(width: 10),
                                    Text(skillItems1[i]['title']),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}

  class HoverContainer extends StatefulWidget {
    final String imagePath;
    final String title;
    final String description;

    const HoverContainer({
      required this.imagePath,
      required this.title,
      required this.description,
      super.key,
    });

    @override
    State<HoverContainer> createState() => _HoverContainerState();
  }

  class _HoverContainerState extends State<HoverContainer> {
    bool _isHovered = false;

    void _onHover(bool isHovered) {
      setState(() {
        _isHovered = isHovered;
      });
    }
    final String emailUrl = 'mailto:s2.abhijeet@example.com';

    @override
    Widget build(BuildContext context) {
      return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform:
          _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
          decoration: kskillsDecoration,
          width: 240,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 25,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 13,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
              SizedBox(height: 45,),
              ElevatedButton(
                  onPressed: ()
                  {
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
                  child: Text("Reach Out",style: TextStyle(color: CustomColor.maincolor4),))
            ],
          ),
        ),
      );
    }
  }

class HoverContainer2 extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  const HoverContainer2({super.key, required this.imagePath, required this.title, required this.description});

  @override
  State<HoverContainer2> createState() => _HoverContainer2State();
}

class _HoverContainer2State extends State<HoverContainer2> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
        _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: kskillsDecoration,
        width: 250,
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 25,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 13,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            SizedBox(height: 45,),
            ElevatedButton(
                onPressed: ()
                {
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
                child: Text("Reach Out",style: TextStyle(color: CustomColor.maincolor4),))
          ],
        ),
      ),
    );
  }
}
class HoverContainer3 extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  const HoverContainer3({super.key, required this.imagePath, required this.title, required this.description});

  @override
  State<HoverContainer3> createState() => _HoverContainer3State();
}

class _HoverContainer3State extends State<HoverContainer3> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
        _isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
        decoration: kskillsDecoration,
        width: 250,
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 25,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 13,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            SizedBox(height: 45,),
            ElevatedButton(
                onPressed: ()
                {
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
                child: Text("Reach Out",style: TextStyle(color: CustomColor.maincolor4),))
          ],
        ),
      ),
    );
  }
}


