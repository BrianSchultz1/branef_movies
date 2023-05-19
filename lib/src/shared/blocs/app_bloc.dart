import 'package:bloc/bloc.dart';
import '../../home/pages/movie_details_page.dart';

enum AppEvent { increment, decrement }

class AppBloc extends Bloc<AppEvent, int> {
  AppBloc() : super(0);

  Stream<int> mapEventToState(AppEvent event) async* {
    switch (event) {
      case AppEvent.increment:
        yield state + 1;
        break;
      case AppEvent.decrement:
        yield state - 1;
        break;
    }
  }
}

class AppState {
  final List<MovieDetails> movies;
  final bool isLoading;

  AppState({required this.movies, required this.isLoading});

  factory AppState.initial() {
    return AppState(movies: [], isLoading: false);
  }
}
