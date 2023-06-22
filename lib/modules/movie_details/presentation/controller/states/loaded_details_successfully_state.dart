import 'package:branef_movies/modules/movie_details/presentation/controller/states/movie_details.state.dart';

import '../../../../movie_list/presentation/controller/states/movie_list_state.dart';

class LoadedDetailsSuccessfullyState extends MovieListState {
  LoadedDetailsSuccessfullyState({required this.movies});

  final List<MovieDetailsState> movies;
}
