import '../states/loading_movies_state.dart';
import '../states/movie_list_state.dart';
import 'movie_list_events.dart';

class LoadMoviesEvent implements MovieListEvents {
  LoadMoviesEvent({this.page = 1});
  final int page;
  final MovieListState loadingState = LoadingMoviesState();
}
