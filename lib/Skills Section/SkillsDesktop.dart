import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import '../Constants/skill_items.dart';

class SkillsDesktop extends StatefulWidget {
  const SkillsDesktop({super.key});

  @override
  State<SkillsDesktop> createState() => _SkillsDesktopState();
}

class _SkillsDesktopState extends State<SkillsDesktop> {
  late List<bool> hoverStates;
  late List<bool> hoverStates1;

  @override
  void initState() {
    super.initState();
    hoverStates = List<bool>.filled(skillItems.length, false);
    hoverStates1 = List<bool>.filled(skillItems1.length, false);
  }

  void onHover(int index, bool hovering, bool isFirstList) {
    setState(() {
      if (isFirstList) {
        hoverStates[index] = hovering;
      } else {
        hoverStates1[index] = hovering;
      }
    });
  }

  Widget buildSkillItem(Map skillItem, bool isHovered) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      width: isHovered ? 200 : 90,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: bgColor1,
        boxShadow: [
          BoxShadow(
            color: bgColor1.withOpacity(0.3),
            offset: const Offset(0, 5),
            blurRadius: 15,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: bgColor1.withOpacity(0.3),
            offset: const Offset(0, 5),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: bgColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(skillItem['img'],width: 60,height: 60,)
              ),
              if (isHovered)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      skillItem['title'] as String,
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                MouseRegion(
                  onEnter: (_) => onHover(i, true, true),
                  onExit: (_) => onHover(i, false, true),
                  child: buildSkillItem(skillItems[i], hoverStates[i]),
                ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < skillItems1.length; i++)
                MouseRegion(
                  onEnter: (_) => onHover(i, true, false),
                  onExit: (_) => onHover(i, false, false),
                  child: buildSkillItem(skillItems1[i], hoverStates1[i]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
