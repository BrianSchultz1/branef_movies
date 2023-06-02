import 'package:bloc/bloc.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial());

  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event case AppEvent.increment) {
      yield state.copyWith(movies: state.movies + 1);
    } else if (event case AppEvent.decrement) {
      yield state.copyWith(movies: state.movies - 1);
    }
  }
}
