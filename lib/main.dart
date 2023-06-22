import 'package:branef_movies/shared/modules/app_module.dart';
import 'package:branef_movies/shared/widgets/app_widget.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/splash/presentation/controller/bloc/splash_bloc.dart';

void main() async {
  runApp(ModularApp(
    module: AppModule(),
    child: DevicePreview(
      enabled: true,
      builder: (context) => BlocProvider<SplashBloc>(
        create: (context) => SplashBloc(),
        child: MyApp(),
      ),
    ),
  ));
}
