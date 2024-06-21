import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Widgets/header_desktop.dart';

import '../Decoration/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          HeaderDesktop(),

          Container(
            width: double.maxFinite,
            height: 500,
            color:  CustomColor.maincolor1
          ),
          Container(
            width: double.maxFinite,
            height: 500,
            color: const Color(0xff2A2A39),
          ),
          SizedBox(height: 20,),
        ],
      )

    );
  }
}
