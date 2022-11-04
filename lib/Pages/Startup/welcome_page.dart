import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'morning_habits.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator WelcomeWidget - FRAME
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: widthScreen,
        height: heightScreen,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(246, 150, 4, 1),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              height: heightScreen * 1.58,
              width: widthScreen,
              child: SvgPicture.asset(
                "Assets/SVG/background_meditation_home_screen.svg",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: heightScreen * 0.77),
              width: widthScreen,
              child: SvgPicture.asset(
                "Assets/SVG/BottomBox.svg",
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: heightScreen * 0.4, left: widthScreen * 0.8),
              child: SvgPicture.asset(
                "Assets/SVG/Cloud_Forward.svg",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: heightScreen * 0.15),
              padding: EdgeInsets.all(10),
              child: const Text(
                'Hi User, Welcome to Morningo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(250, 248, 244, 1),
                  fontFamily: 'Manrope',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),
            SafeArea(
              child: Center(
                heightFactor: 3,
                child: Container(
                  child: const Text(
                    'MORNINGO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(225, 238, 221, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing: 15,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: heightScreen * 0.28),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: // Figma Flutter Generator ExploretheappfindsomepeaceofmindtoprepareforyourmorningroutineWidget - TEXT
                  const Text(
                'Explore the app, Find some peace of mind to prepare for your morning routine',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(235, 234, 236, 1),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.5 /*PERCENT not supported*/
                    ),
              ),
            ),
            Positioned(
              top: heightScreen * 0.85,
              left: 70.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orangeAccent,
                    elevation: 10,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MorningHabits()),
                    );
                  },
                  child: const Text(
                    'GET STARTED',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: heightScreen * 0.50,
              ),
              child: SvgPicture.asset(
                "Assets/SVG/Group.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
