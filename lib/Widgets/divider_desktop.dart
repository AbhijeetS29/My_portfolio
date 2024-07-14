import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class DividerDesktop extends StatefulWidget {
  const DividerDesktop({super.key});

  @override
  State<DividerDesktop> createState() => _DividerDesktopState();
}

class _DividerDesktopState extends State<DividerDesktop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Container(
        width: double.infinity,
        height: 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor1,
          boxShadow: const [
            BoxShadow(
              color: bgColor1,
              offset: Offset(-2, 0),
              blurRadius: 20,
            ),

          ],
        ),
      ),
    );
  }
}
