import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:branef_movies/shared/utils/colors_standard.dart';

import '../controller/bloc/splash_bloc.dart';
import '../controller/events/splash_load_event.dart';
import '../controller/state/splash_loaded_successfully_event.dart';
import '../controller/state/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  late final SplashBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SplashBloc();
    bloc.add(const SplashLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedSuccessfullyState) {
            return;
          }
        },
        child: Container(
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
      ),
    );
  }
}
