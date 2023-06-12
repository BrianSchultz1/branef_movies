import 'package:bloc/bloc.dart';
import 'package:branef_movies/modules/splash/presentation/controller/events/splash_events.dart';
import 'package:branef_movies/modules/splash/presentation/controller/state/splash_initial_state.dart';
import 'package:branef_movies/modules/splash/presentation/controller/state/splash_state.dart';
import 'dart:async';
import '../events/splash_timer_finished_event.dart';
import '../events/splash_timer_started_event.dart';
import '../state/splash_loading_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState());

  SplashState get initialState => SplashInitialState();

  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashTimerStartedEvent) {
      yield SplashLoadingState();
      await Future.delayed(const Duration(milliseconds: 4000));
      add(SplashTimerFinishedEvent());
    } else if (event is SplashTimerFinishedEvent) {
      yield SplashInitialState();
    }
  }
}
