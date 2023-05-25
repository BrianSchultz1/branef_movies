import 'package:branef_movies/src/models/components/colors_standard.dart';
import 'package:flutter/material.dart';

class MoviesDetails extends StatelessWidget {
  final String movieTitle;
  final String movieInfo;
  final String imageUrl;
  final String movieDetails;

  const MoviesDetails({
    Key? key,
    required this.movieTitle,
    required this.movieInfo,
    required this.imageUrl,
    required this.movieDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStandart.backgroundColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: [
              Hero(
                tag: imageUrl,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.59,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      ColorStandart.backgroundColor,
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
                    color: ColorStandart.whiteColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.9,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        movieTitle,
                        style: const TextStyle(
                          color: ColorStandart.whiteColor,
                          fontSize: 32,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Opacity(
                        opacity: 0.8,
                        child: Text(
                          movieInfo,
                          style: const TextStyle(
                            color: ColorStandart.whiteColor,
                            fontSize: 24,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        child: Opacity(
                          opacity: 0.5,
                          child: Text(
                            movieDetails,
                            style: const TextStyle(
                              color: ColorStandart.whiteColor,
                              fontSize: 18,
                              fontFamily: 'Roboto-condensed',
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
        ),
      ),
    );
  }
}
