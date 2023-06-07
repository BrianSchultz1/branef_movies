import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/movie_list_events.dart';
import '../states/movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvents, MovieListState> {
  MovieListBloc(super.initialState);
}
