import 'package:flutter/material.dart';

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
      ),
    );
  }
}
