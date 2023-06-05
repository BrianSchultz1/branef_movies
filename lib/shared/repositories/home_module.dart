import 'package:branef_movies/models/home/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../models/home/presentation/splash.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const Splash()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
      ];
}
