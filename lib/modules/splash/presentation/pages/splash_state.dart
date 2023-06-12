import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../controller/bloc/splash_bloc.dart';
import '../controller/events/splash_timer_started_event.dart';
import '../controller/state/splash_state.dart';
import 'package:branef_movies/shared/utils/colors_standard.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashBloc splashBloc = SplashBloc();

  @override
  void initState() {
    super.initState();
    splashBloc.add(SplashTimerStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      bloc: splashBloc,
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            color: ColorStandard.backgroundColor,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BranefMovies",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorStandard.whiteColor,
                      fontSize: 60,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Romanesco',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Watch and find movies that bring your mood back",
                    textAlign: TextAlign.center,
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
      },
    );
  }
}
