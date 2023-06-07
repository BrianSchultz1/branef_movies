// Modulo do projeto fica armazenado aqui
import 'package:branef_movies/shared/repositories/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../modules/movie_details/details_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ChildRoute(
          '/details',
          child: (_, args) => DetailsPage(
            movieTitle: args.data['movieTitle'] as String,
            movieInfo: args.data['movieInfo'] as String,
            imageUrl: args.data['imageUrl'] as String,
            movieDetails: args.data['movieDetails'] as String,
          ),
        ),
      ];
}
