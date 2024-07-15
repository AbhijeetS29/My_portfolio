import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants/colors.dart';
import '../Constants/nav_items.dart';
import '../Decoration/site_logo.dart';

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
            const Spacer(), // Adds space between SiteLogo and the navigation items


            for (int i = 0; i < navTitles.length; i++)
              Padding(
                padding: const EdgeInsets.only(right: 20),
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
                            style: const TextStyle(
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
            const Spacer(), // Adds space between the navigation items and the last container
            GestureDetector(
              onTap: () async {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 's2.abhijeet@gmail.com',
                  query: 'subject=CV Request&body=Hi, I would like to request your CV.',
                );
                var url = params.toString();
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }

              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultPadding),
                      color: bgColor1,
                    boxShadow:const [
                      BoxShadow(color: bgColor1,offset: Offset(0, -1),blurRadius: defaultPadding/4),
                      BoxShadow(color: bgColor1,offset: Offset(0, 1),blurRadius: defaultPadding/4),
                    ]
                ),
                child: const Row(
                  children: [
                    Text(
                      "Download CV",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold,
                        color: bgColor,
                      ),
                    ),
                    Text("  "),
                    Icon(Icons.download,color: bgColor,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
