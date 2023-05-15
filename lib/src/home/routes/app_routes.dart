import 'package:flutter/material.dart';

import '../presentation/splash.dart';
import '../repositories/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> generateRoutes(BuildContext context) {
    return {
      '/': (context) => const Splash(),
      '/home': (context) => const HomePage(),
    };
  }
}
