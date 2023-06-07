import 'package:branef_movies/features/home/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import '../../../movie_details/movie_details.dart';

class MovieList {
  List<MovieDetails> movies = [];

  void addMovie(MovieDetails movie) {
    movies.add(movie);
  }

  Widget buildMoviesList(BuildContext context) {
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
