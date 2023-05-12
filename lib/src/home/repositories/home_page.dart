import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/colors_standard.dart';
import 'header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: const Column(
            children: [
              Header(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ));
  }
}
