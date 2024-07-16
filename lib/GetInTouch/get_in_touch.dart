import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/GetInTouch/GetinTouchHeading.dart';
import 'package:my_portfolio/IntroTexts/SubTexts.dart';
import 'package:my_portfolio/IntroTexts/description_text.dart';
import 'package:my_portfolio/IntroTexts/headline_text.dart';
import 'package:my_portfolio/Widgets/divider_desktop.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/colors.dart';
import '../Decoration/animated_texts_componenets.dart';
import 'Animated.dart';
import 'MainContact.dart';

class GetTouch extends StatefulWidget {
  const GetTouch({super.key});

  @override
  State<GetTouch> createState() => _GetTouchState();
}

class _GetTouchState extends State<GetTouch> {
  // Define your URLs
  final String emailUrl = 'mailto:s2.abhijeet@example.com';
  final String githubUrl = 'https://github.com/AbhijeetS29';
  final String linkedinUrl = 'https://www.linkedin.com/in/abhijeet-singh-931817245/';
  final String instagramUrl = 'https://www.instagram.com/abhijeet.singh09/';
  final String WhatsappUrl = 'https://www.instagram.com/abhijeet.singh09/';

  // Method to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _launchWhatsApp(String phoneNumber, String message) async {
    String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor1,
          boxShadow: [
            BoxShadow(
              color:bgColor1.withOpacity(0.3),
              offset: Offset(0, 5),
              blurRadius: 15,
              spreadRadius: 2, // Change spread radius on hover
            ),
            BoxShadow(
              color: bgColor1.withOpacity(0.3),
              offset: Offset(0, 5),
              blurRadius: 15,
              spreadRadius: 2, // Change spread radius on hover
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 20),
                  child: const ContactsHeading(start: 0, end: 25),
                ),Padding(
                  padding: const EdgeInsets.only(top: 15,left: 20),
                  child: const MyPortfolioText(start: 0, end: 25),
                )
                ,
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 20,bottom: 20),
                  child: Text("I am an experienced application and web developer with expertise in Flutter and Kotlin. I excel in creating user-friendly designs and have a proven track record of delivering high-quality applications. In addition to my technical skills, I volunteer with the MADHAV SEWA SOCIETY, an NGO dedicated to serving humanity by providing essential services and support. I also have expertise in content writing, which complements my development skills and enhances my ability to create engaging and informative content.",
                  style: TextStyle(
                    fontFamily: 'Open Sans',fontWeight: FontWeight.w500
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: bgColor1,borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => _launchURL(emailUrl),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(FontAwesomeIcons.mailBulk,color: Colors.white,size: 25,
                                ),
                              ),Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Gmail",
                                    style: TextStyle(fontSize: 10)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(githubUrl),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(FontAwesomeIcons.github,color: Colors.white,size: 25,
                                ),
                              ),Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Github",style: TextStyle(fontSize: 10))
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(linkedinUrl),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(FontAwesomeIcons.linkedin,color: Colors.white,size: 25,
                                ),
                              ),Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("LinkedIn",
                                    style: TextStyle(fontSize: 10)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(instagramUrl),
                        child: Container(
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(60)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(FontAwesomeIcons.instagram,color: Colors.white,size: 25,
                                ),
                              ),Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Instagram",
                                    style: TextStyle(fontSize: 10)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),GestureDetector(
                        onTap: () => _launchWhatsApp('6284056754', 'Hello, I\'m interested in your services'),
                        child: Container(
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(60)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(FontAwesomeIcons.whatsapp,color: Colors.white,size: 25,
                                ),
                              ),Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("WhatsApp",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
