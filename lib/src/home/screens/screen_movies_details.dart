import 'package:branef_movies/src/home/components/colors_standard.dart';
import 'package:flutter/material.dart';

class MoviesDetails extends StatefulWidget {
  const MoviesDetails({Key? key}) : super(key: key);

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                // Coloque aqui o widget da imagem
                ),
          ),
          Container(
            padding: const EdgeInsets.all(110),
            child: const Column(
              children: [
                Text(
                  'Texto 1',
                  style: TextStyle(color: whiteColor, fontSize: 48),
                ),
                Text(
                  'Texto 2',
                  style: TextStyle(color: whiteColor, fontSize: 24),
                ),
                Text(
                  'Texto 3',
                  style: TextStyle(color: whiteColor, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
