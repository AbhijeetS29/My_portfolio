import 'package:flutter/material.dart';
import '../Constants/nav_items.dart';
import '../Decoration/site_logo.dart';
import '../Decoration/style.dart';
import '../constants/colors.dart';

class HeaderDesktop extends StatelessWidget {
  // const HeaderDesktop({
  //   super.key,
  //   required this.onNavMenuTap,
  // });
  // final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      width: double.maxFinite,
      decoration: kHederDecoration,
      child: Row(
        children: [
          SizedBox(width: 20),
          SiteLogo(
            onTap: () {},
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  // onNavMenuTap(i);
                },
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
