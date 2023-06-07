import 'package:branef_movies/shared/utils/colors_standard.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'splash.dart';

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 4400), () {
      Modular.to.pushReplacementNamed('/home');
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
