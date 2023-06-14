import 'package:flutter/material.dart';
import 'movies_details_page.dart';

class DetailsPage extends MoviesDetailsPage {
  const DetailsPage({
    Key? key,
    required String movieTitle,
    required String movieInfo,
    required String imageUrl,
    required String movieDetails,
  }) : super(
          key: key,
          movieTitle: movieTitle,
          movieInfo: movieInfo,
          imageUrl: imageUrl,
          movieDetails: movieDetails,
        );
}
