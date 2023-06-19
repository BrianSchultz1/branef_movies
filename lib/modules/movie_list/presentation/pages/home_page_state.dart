import 'package:branef_movies/modules/movie_list/presentation/controller/states/loading_movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utils/colors_standard.dart';
import '../../services/api_service.dart';
import '../controller/blocs/movie_list_bloc.dart';
import '../controller/events/load_movies_event.dart';
import '../controller/states/movie_list_state.dart';
import 'home_page.dart';
import 'movie_list.dart';

class HomePageState extends State<HomePage> {
  static const int moviesPerPageLimit = 50;

  int currentPageIndex = 4;
  MovieList movieList = MovieList();
  bool isLoadingMovies = false;
  late final MovieListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc.add(LoadMoviesEvent());
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    if (isLoadingMovies) return;

    setState(() {
      isLoadingMovies = true;
    });

    try {
      final movieStartIndex = (currentPageIndex - 1) * moviesPerPageLimit + 6;
      final movieEndIndex = movieStartIndex + moviesPerPageLimit - 1;

      // Lista para armazenar as chamadas assíncronas de carregamento de detalhes
      final movieDetailsFutures = <Future<void>>[];

      // Loop assíncrono para carregar detalhes dos filmes em paralelo
      for (int movieIndex = movieStartIndex;
          movieIndex <= movieEndIndex;
          movieIndex++) {
        movieDetailsFutures.add(_loadMovieDetails(movieIndex));
      }

      // Aguarda a conclusão de todas as chamadas assíncronas
      await Future.wait(movieDetailsFutures);

      currentPageIndex++;
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao carregar os detalhes do filme');
    } finally {
      setState(() {
        isLoadingMovies = false;
      });
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
            return Container();
          }
          return Scaffold(
            backgroundColor: ColorStandard.backgroundColor,
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  _buildMoviesListWidget(context),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        });
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

  Widget _buildMoviesListWidget(BuildContext context) {
    return movieList.buildMoviesList(context);
  }
}
