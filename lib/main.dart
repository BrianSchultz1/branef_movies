import 'package:branef_movies/src/home/components/colors_standard.dart';
import 'package:branef_movies/src/home/routes/app_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(primaryColor: backgroundColor),
      initialRoute: '/',
      routes: AppRoutes.generateRoutes(context),
    );
  }
}
