import 'package:branef_movies/src/models/components/colors_standard.dart';
import 'package:branef_movies/src/models/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
        color: ColorStandart.backgroundColor,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "BranefMovies",
                style: TextStyle(
                  color: ColorStandart.whiteColor,
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
                  color: ColorStandart.whiteColor,
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