import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  Widget urlLauncher(String imagePath, String url) {
    return IconButton(
      icon: SvgPicture.asset(imagePath, color: Colors.black, width: 35.0),
      onPressed: () async {
        if (!await launchUrl(Uri.parse(url))) {
          throw Exception("Could not launch $url");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              //Introduction, First section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/me-circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 35.0),
                    SizedBox(height: 10.0),
                    Sans(
                      "Hello! I'm Mosab AbuMoammar I Specialize in flutter development",
                      15.0,
                    ),
                    Sans(
                      "I strive to ensure astounding performance with state of",
                      15.0,
                    ),
                    Sans(
                      "the art security for Android, Ios, Web, Mac, Linux and Windows",
                      15.0,
                    ),
                    SizedBox(height: 15.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer("Flutter"),
                        tealContainer("Firebase"),
                        tealContainer("Android"),
                        tealContainer("Windows"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),

              //Web development, second section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: "assets/webL.png"),
                  SizedBox(height: 30.0),
                  SansBold("Web development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "I'm here to build your presence online with state of the art web apps",
                15.0,
              ),

              // App development, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("App development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "Do you need a high-performance, responsive and beautiful app? Don't Worry, I've covered.",
                15.0,
              ),

              //Back end development, forth section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(imagePath: "assets/firebase.png", width: 200.0),
                  SizedBox(height: 30.0),
                  SansBold("Back-end development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                15.0,
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
