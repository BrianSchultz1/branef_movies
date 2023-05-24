import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../components/colors_standard.dart';
import 'movie_details.dart';

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
              _movieItem(context, movie),
              const SizedBox(height: 10),
              _buildLine(),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }

  Widget _movieItem(BuildContext context, MovieDetails movie) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Hero(
            tag: movie.imageUrl,
            child: SizedBox(
              width: 82,
              height: 122,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  movie.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: const TextStyle(
                    color: whiteColor, fontFamily: 'Roboto', fontSize: 16),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: movie.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 13,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(height: 10),
              Text(
                '${movie.releaseYear} | ${movie.duration} min',
                style: const TextStyle(
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: {
                      'movieTitle': movie.title,
                      'movieInfo':
                          '${movie.releaseYear} | ${movie.duration} min',
                      'imageUrl': movie.imageUrl,
                      'movieDetails': movie.details
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondaryPink),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(107, 26)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  elevation: MaterialStateProperty.all<double>(10),
                  shadowColor: MaterialStateProperty.all<Color>(secondaryPink),
                ),
                child: const Text('Detalhes'),
              ),
            ],
          ),
        ],
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
