import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/splash/presentation/controller/bloc/splash_bloc.dart';
import '../utils/colors_standard.dart';

class MyApp extends StatelessWidget {
  final SplashBloc appBloc = SplashBloc();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => appBloc,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(primaryColor: ColorStandard.backgroundColor),
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}
