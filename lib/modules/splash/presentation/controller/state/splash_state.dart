import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/splash_bloc.dart';
import '../events/splash_timer_finished_event.dart';

abstract class SplashState {
  SplashBloc splashBloc = Modular.get<SplashBloc>();

  SplashState() {
    Timer(const Duration(milliseconds: 4400), () {
      splashBloc.add(SplashTimerFinishedEvent());
    });
  }
}
