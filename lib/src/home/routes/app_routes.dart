import 'package:flutter/material.dart';

import '../presentation/splash.dart';
import '../pages/home_page.dart';
import '../pages/movies_details_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> generateRoutes(
      BuildContext context) {
    return {
      '/': (context) => const Splash(),
      '/home': (context) => const HomePage(),
      '/details': (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final movieTitle = args['movieTitle'] as String;
        final movieInfo = args['movieInfo'] as String;
        final imageUrl = args['imageUrl'] as String;
        final movieDetails = args['movieDetails'] as String;
        return MoviesDetails(
          movieTitle: movieTitle,
          movieInfo: movieInfo,
          imageUrl: imageUrl,
          movieDetails: movieDetails,
        );
      },
    };
  }
}
