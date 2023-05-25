import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/colors_standard.dart';
import '../services/api_service.dart';
import 'home_page.dart';
import 'movie_list.dart';

class HomePageState extends State<HomePage> {
  int currentPage = 4;
  int moviesPerPage = 50;
  MovieList movieList = MovieList();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      final movieStartId = (currentPage - 1) * moviesPerPage + 6;
      final movieEndId = movieStartId + moviesPerPage - 1;
      for (int movieId = movieStartId; movieId <= movieEndId; movieId++) {
        final movieDetails = await getMovieDetails(movieId);
        if (movieDetails != null) {
          setState(() {
            movieList.addMovie(movieDetails);
          });
        }
      }
      currentPage++;
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao carregar os detalhes do filme: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStandart.backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            movieList.buildMoviesList(context),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: ColorStandart.backgroundColor,
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
}
