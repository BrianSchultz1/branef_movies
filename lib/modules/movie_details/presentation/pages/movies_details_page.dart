import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/colors_standard.dart';
import '../controller/states/loading_movies_details_state.dart';

class MoviesDetailsPage extends StatefulWidget {
  final String movieTitle;
  final String movieInfo;
  final String imageUrl;
  final String movieDetails;

  const MoviesDetailsPage({
    Key? key,
    required this.movieTitle,
    required this.movieInfo,
    required this.imageUrl,
    required this.movieDetails,
  }) : super(key: key);

  @override
  State<MoviesDetailsPage> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is LoadingMovieDetailsState) {
          return Scaffold(
            backgroundColor: ColorStandard.backgroundColor,
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Stack(
                  children: [
                    Hero(
                      tag: widget.imageUrl,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.59,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            ColorStandard.backgroundColor,
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
                          color: ColorStandard.whiteColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 1.9,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.movieTitle,
                              style: const TextStyle(
                                color: ColorStandard.whiteColor,
                                fontSize: 32,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(height: 5),
                            Opacity(
                              opacity: 0.8,
                              child: Text(
                                widget.movieInfo,
                                style: const TextStyle(
                                  color: ColorStandard.whiteColor,
                                  fontSize: 24,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              child: Opacity(
                                opacity: 0.5,
                                child: Text(
                                  widget.movieDetails,
                                  style: const TextStyle(
                                    color: ColorStandard.whiteColor,
                                    fontSize: 18,
                                    fontFamily: 'Roboto-condensed',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
