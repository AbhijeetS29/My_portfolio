import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/colors.dart';

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

  // Method to launch URLs
  void _launchURL(String url) async {
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
        constraints: const BoxConstraints(
          minHeight: 350.0,
        ),
        decoration: BoxDecoration(
            color: CustomColor.maincolor3.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "An Application Developer",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: CustomColor.maincolor4,
                    fontFamily: 'Open Sans'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Text(
                "I am an experienced application and web developer with expertise in Flutter and Kotlin. I excel in creating user-friendly designs and have a strong track record in delivering high-quality projects. In addition to my professional work, I contribute as a volunteer technical expert. I am driven by a passion for continuous learning and aim to achieve success in my career",
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 23,
                    color: CustomColor.maincolor4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _launchURL(emailUrl),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/email.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _launchURL(githubUrl),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/github (1).png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _launchURL(linkedinUrl),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/linkedin (1).png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _launchURL(instagramUrl),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/instagram.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
