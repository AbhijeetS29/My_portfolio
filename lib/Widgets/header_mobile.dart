import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';

import '../Decoration/site_logo.dart';
import '../Decoration/style.dart';


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
      decoration: kHederDecoration,
      child: Row(
        children: [
          SizedBox(width: 20,),
          SiteLogo(
            onTap: onLogoTap,
          ),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: Icon(Icons.menu_outlined,color: CustomColor.maincolor4,),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
