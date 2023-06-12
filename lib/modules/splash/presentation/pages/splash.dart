import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import '../controller/bloc/splash_bloc.dart';
import '../controller/events/splash_timer_finished_event.dart';

class SplashState {
  SplashBloc splashBloc = Modular.get<SplashBloc>();

  SplashState() {
    Timer(const Duration(milliseconds: 4400), () {
      splashBloc.add(SplashTimerFinishedEvent());
    });
  }
}
