import 'package:branef_movies/modules/movie_details/presentation/controller/states/movie_details.state.dart';
import 'package:branef_movies/modules/movie_list/presentation/controller/events/load_movies_list_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../movie_details/presentation/controller/states/loaded_details_successfully_state.dart';
import '../events/movie_list_events.dart';
import '../states/loading_movies_state.dart';
import '../../../../movie_list/presentation/controller/states/movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvents, MovieListState> {
  MovieListBloc(MovieListState initialState) : super(initialState) {
    on<LoadMoviesListEvent>(
      (event, emit) async {
        emit(LoadingMoviesState());
        List<MovieDetailsState> movies = [];
        emit(LoadedDetailsSuccessfullyState(movies: movies));
      },
    );
  }
}
