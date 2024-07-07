import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import '../Constants/nav_items.dart';
import '../Decoration/site_logo.dart';
import '../Decoration/style.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
        child: Row(
          children: [
            SiteLogo(
              onTap: () {},
            ),
            Spacer(), // Adds space between SiteLogo and the navigation items
            for (int i = 0; i < navTitles.length; i++)
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(milliseconds: 900 + (i * 200)),
                  builder: (context, double value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, (1 - value) * -20),
                        child: TextButton(
                          onPressed: () {
                            onNavMenuTap(i);
                          },
                          child: Text(
                            navTitles[i],
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w500,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            Spacer(), // Adds space between the navigation items and the last container
            GestureDetector(
              onTap: () {
                // Your onTap logic here
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.pinkAccent,
                    Colors.blueAccent,
                  ]),
                  borderRadius: BorderRadius.circular(8.0),
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
                child: Text(
                  "Whatsapp",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
