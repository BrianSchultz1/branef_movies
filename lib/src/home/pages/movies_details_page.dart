import 'package:branef_movies/src/home/components/colors_standard.dart';
import 'package:flutter/material.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final movieTitle = args['movieTitle'] as String;
    final movieInfo = args['movieInfo'] as String;
    final imageUrl = args['imageUrl'] as String;
    final movieDetails = args['movieDetails'] as String;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.59,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  backgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 2,
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      movieTitle,
                      style: const TextStyle(color: whiteColor, fontSize: 28),
                    ),
                  ),
                  Center(
                    child: Text(
                      movieInfo,
                      style: const TextStyle(color: whiteColor, fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Center(
                      child: Text(
                        movieDetails,
                        style: const TextStyle(color: whiteColor, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
