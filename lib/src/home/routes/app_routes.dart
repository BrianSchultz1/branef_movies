import 'package:flutter/material.dart';

import '../presentation/splash.dart';
import '../screens/sreen_home_page.dart';
import '../screens/screen_movies_details.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> generateRoutes(BuildContext context) {
    return {
      '/': (context) => const Splash(),
      '/home': (context) => const HomePage(),
      '/details': (context) => const MoviesDetails(),
    };
  }
}
