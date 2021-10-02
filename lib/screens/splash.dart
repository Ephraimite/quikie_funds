import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quikie_funds/constants.dart';
import 'package:quikie_funds/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    showSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCOLOR_PRIMARY,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('Quikie funds',
                textStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            TyperAnimatedText(
              'Quikie funds',
              textStyle: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSplash() {
    Timer(Duration(seconds: 6), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }
}
