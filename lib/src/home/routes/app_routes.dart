import 'package:flutter/material.dart';

import '../presentation/splash.dart';
import '../pages/home_page.dart';
import '../pages/movies_details_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> generateRoutes(BuildContext context) {
    return {
      '/': (context) => const Splash(),
      '/home': (context) => const HomePage(),
      '/details': (context) => const MoviesDetails(),
    };
  }
}
