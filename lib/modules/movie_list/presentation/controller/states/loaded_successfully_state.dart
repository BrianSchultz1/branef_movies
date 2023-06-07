import 'package:branef_movies/modules/movie_list/presentation/controller/states/movie_list_state.dart';
import '../../../../movie_details/movie_details.dart';

class LoadedSuccessfullyState implements MovieListState {
  LoadedSuccessfullyState({required this.movies});

  final List<MovieDetails> movies;
}
