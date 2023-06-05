import 'package:flutter/material.dart';
import 'movies_details_page.dart';

class DetailsPage extends StatelessWidget {
  final String movieTitle;
  final String movieInfo;
  final String imageUrl;
  final String movieDetails;

  const DetailsPage({
    Key? key,
    required this.movieTitle,
    required this.movieInfo,
    required this.imageUrl,
    required this.movieDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoviesDetails(
      movieTitle: movieTitle,
      movieInfo: movieInfo,
      imageUrl: imageUrl,
      movieDetails: movieDetails,
    );
  }
}
