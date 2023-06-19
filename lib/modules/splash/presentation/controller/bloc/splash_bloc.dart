import 'package:bloc/bloc.dart';
import 'package:branef_movies/modules/splash/presentation/controller/events/splash_events.dart';
import 'package:branef_movies/modules/splash/presentation/controller/state/splash_state.dart';
import '../events/splash_load_event.dart';
import '../state/splash_loaded_successfully_state.dart';
import '../state/splash_loading_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashLoadingState()) {
    on<SplashLoadEvent>(
      (event, emit) async {
        emit(const SplashLoadingState());
        await Future.delayed(const Duration(milliseconds: 4000));
        emit(const SplashLoadedSuccessfullyState());
      },
    );
  }
}
