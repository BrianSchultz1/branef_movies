import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/colors_standard.dart';
import '../services/api_service.dart';
import 'home_page.dart';
import 'movie_list.dart';

class HomePageState extends State<HomePage> {
  static const int moviesPerPageLimit = 50;

  int currentPageIndex = 4;
  MovieList movieList = MovieList();
  bool isLoadingMovies = false;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    if (isLoadingMovies) return;

    setState(() {
      isLoadingMovies = true;
    });

    try {
      final movieStartId = (currentPageIndex - 1) * moviesPerPageLimit + 6;
      final movieEndId = movieStartId + moviesPerPageLimit - 1;
      for (int movieId = movieStartId; movieId <= movieEndId; movieId++) {
        await _loadMovieDetails(movieId);
      }
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
