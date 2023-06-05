import 'package:branef_movies/models/components/colors_standard.dart';
import 'package:branef_movies/models/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 4400), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        color: ColorStandard.backgroundColor,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "BranefMovies",
                style: TextStyle(
                  color: ColorStandard.whiteColor,
                  fontSize: 60,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Romanesco',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                textAlign: TextAlign.center,
                "Watch and find movies that bring your mood back",
                style: TextStyle(
                  color: ColorStandard.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Staatliches',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}