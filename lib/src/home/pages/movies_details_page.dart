import 'package:branef_movies/src/home/components/colors_standard.dart';
import 'package:flutter/material.dart';

class MoviesDetails extends StatelessWidget {
  final String movieTitle;
  final String movieInfo;
  final String imageUrl;
  final String movieDetails;

  const MoviesDetails({
    super.key,
    required this.movieTitle,
    required this.movieInfo,
    required this.imageUrl,
    required this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.59,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  backgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 1.9,
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      movieTitle,
                      style: const TextStyle(
                          color: whiteColor,
                          fontSize: 32,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Opacity(
                      opacity: 0.8,
                      child: Text(
                        movieInfo,
                        style: const TextStyle(
                            color: whiteColor,
                            fontSize: 24,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Center(
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          movieDetails,
                          style: const TextStyle(
                            color: whiteColor,
                            fontSize: 18,
                            fontFamily: 'Roboto-condensed',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
