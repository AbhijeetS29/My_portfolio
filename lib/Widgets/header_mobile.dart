import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Decoration/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
      width: double.maxFinite,

      child: Row(
        children: [
          const SizedBox(width: 20,),
          SiteLogo(
            onTap: onLogoTap,
          ),
          const Spacer(),
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
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
