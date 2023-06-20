import 'package:branef_movies/modules/movie_list/presentation/controller/events/load_movies_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/movie_list_events.dart';
import '../states/loading_movies_state.dart';
import '../states/movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvents, MovieListState> {
  MovieListBloc(MovieListState initialState) : super(initialState) {
    on<LoadMoviesEvent>(
      (event, emit) async {
        emit(LoadingMoviesState());
      },
    );
  }
}
