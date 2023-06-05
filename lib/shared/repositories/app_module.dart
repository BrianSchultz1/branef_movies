// Modulo do projeto fica armazenado aqui
import 'package:branef_movies/shared/repositories/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        // ModuleRoute('/details', module: HomeModule()),
      ];
}
