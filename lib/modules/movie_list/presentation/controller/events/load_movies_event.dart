// o evento que vai carregar os filmes

import 'movie_list_events.dart';

class LoadMoviesEvent implements MovieListEvents {
  LoadMoviesEvent({this.page = 1});
  final int page;
}
