import 'package:branef_movies/features/home/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../features/movie_details/details_page.dart';
import '../../features/presentation/splash.dart';

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
