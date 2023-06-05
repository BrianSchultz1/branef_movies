import 'package:flutter/material.dart';
import '../pages/movies_details_page.dart';
import '../presentation/splash.dart';
import '../pages/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      '/': (context) => const Splash(),
      '/home': (context) => const HomePage(),
      '/details': (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return MoviesDetails(
          movieTitle: args['movieTitle'] as String,
          movieInfo: args['movieInfo'] as String,
          imageUrl: args['imageUrl'] as String,
          movieDetails: args['movieDetails'] as String,
        );
      },
    };
  }
}
