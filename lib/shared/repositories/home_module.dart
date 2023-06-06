import 'package:branef_movies/models/home/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../models/home/pages/details_page.dart';
import '../../models/home/presentation/splash.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const Splash()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ChildRoute('/details',
            child: (_, args) => DetailsPage(
                  movieTitle: args.data['movieTitle'] as String,
                  movieInfo: args.data['movieInfo'] as String,
                  imageUrl: args.data['imageUrl'] as String,
                  movieDetails: args.data['movieDetails'] as String,
                )),
      ];
}
