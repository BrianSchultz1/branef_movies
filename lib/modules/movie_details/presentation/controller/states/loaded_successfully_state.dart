import 'package:branef_movies/modules/movie_details/presentation/controller/states/movie_details.state.dart';

class LoadedSuccessfullyState implements MovieDetailsState {
  LoadedSuccessfullyState({required this.movies});

  final List<MovieDetailsState> movies;
}
