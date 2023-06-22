import 'package:branef_movies/modules/movie_list/presentation/controller/events/load_movies_list_event.dart';
import 'package:branef_movies/modules/movie_list/presentation/controller/states/loading_movies_state.dart';
import 'package:branef_movies/modules/movie_list/presentation/controller/states/loaded_successfully_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utils/colors_standard.dart';
import '../../../movie_details/presentation/pages/movie_details.dart';
import '../../services/api_service.dart';
import '../controller/blocs/movie_list_bloc.dart';
import '../controller/states/movie_list_state.dart';
import '../widgets/movie_item.dart';
import 'home_page.dart';
import 'movie_list.dart';

class HomePageState extends State<HomePage> {
  static const int moviesPerPageLimit = 50;

  int currentPageIndex = 4;
  MovieList movieList = MovieList();
  bool isLoadingMovies = false;
  final MovieListBloc bloc = MovieListBloc(LoadingMoviesState());

  @override
  void initState() {
    super.initState();
    // bloc = MovieListBloc(LoadingMoviesState());
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    final movieStartIndex = (currentPageIndex - 1) * moviesPerPageLimit + 6;
    final movieEndIndex = movieStartIndex + moviesPerPageLimit - 1;
    final movieDetailsFutures = <Future<void>>[];
    if (isLoadingMovies) return;

    try {
      for (int movieIndex = movieStartIndex;
          movieIndex <= movieEndIndex;
          movieIndex++) {
        movieDetailsFutures.add(_loadMovieDetails(movieIndex));
      }

      await Future.wait(movieDetailsFutures);

      currentPageIndex++;

      // Após o carregamento dos filmes, envie o evento para transição de estado
      bloc.add(LoadMoviesListEvent());
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao carregar os detalhes do filme');
    }
  }

  Future<void> _loadMovieDetails(int movieId) async {
    final movieDetails = await getMovieDetails(movieId);
    if (movieDetails != null) {
      setState(() {
        movieList.addMovie(movieDetails);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc, MovieListState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is LoadingMoviesState) {
          return Scaffold(
            backgroundColor: ColorStandard.backgroundColor,
            appBar: _buildAppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoadedSuccessfullyState) {
          return Scaffold(
            backgroundColor: ColorStandard.backgroundColor,
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  _buildMoviesListWidget(state.movies),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: ColorStandard.backgroundColor,
      elevation: 2,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: const Text(
        'BranefMovies',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.normal,
          fontFamily: 'Romanesco',
        ),
      ),
    );
  }

  Widget _buildMoviesListWidget(List<MovieDetails> movies) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Column(
            children: [
              MovieItem(movie: movie),
              const SizedBox(height: 10),
              _buildLine(),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(0, 145, 145, 145),
            Colors.white,
            Color.fromARGB(0, 145, 145, 145),
          ],
          stops: [0.1, 0.5, 1.0],
        ),
      ),
    );
  }
}
