import 'package:branef_movies/src/home/components/colors_standard.dart';
import 'package:branef_movies/src/home/routes/app_routes.dart';
import 'package:branef_movies/src/shared/blocs/app_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppBloc appBloc = AppBloc();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => appBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(primaryColor: backgroundColor),
        initialRoute: '/',
        routes: AppRoutes.generateRoutes(context),
      ),
    );
  }
}
