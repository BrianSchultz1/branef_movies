import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../components/colors_standard.dart';
import '../services/api_service.dart';
import 'movie_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 4;
  int moviesPerPage = 50;
  List<MovieDetails> movies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      final movieStartId = (currentPage - 1) * moviesPerPage + 6;
      final movieEndId = movieStartId + moviesPerPage - 1;
      for (int movieId = movieStartId; movieId <= movieEndId; movieId++) {
        final movieDetails = await getMovieDetails(movieId);
        if (movieDetails != null) {
          setState(() {
            movies.add(movieDetails);
          });
        }
      }
      currentPage++;
    } catch (e) {
      print('Erro ao carregar os detalhes do filme: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildMoviesList(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 2,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: const Text(
        'BranefMovies',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.normal,
          fontFamily: 'Romanesco',
        ),
      ),
    );
  }

  Widget _buildMoviesList() {
    return Container(
      constraints: const BoxConstraints(
          maxWidth: 500), // Defina a largura máxima desejada
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _movieItem(movie);
        },
      ),
    );
  }

  Widget _movieItem(MovieDetails movie) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 82,
                height: 122,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: movie.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 13,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${movie.releaseYear} | ${movie.duration} min',
                      style: const TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: {
                            'movieTitle': movie.title,
                            'movieInfo':
                                '${movie.releaseYear} | ${movie.duration} min',
                            'imageUrl': movie.imageUrl,
                            'movieDetails': movie.details
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(secondaryPink),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(107, 26)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(10),
                        shadowColor:
                            MaterialStateProperty.all<Color>(secondaryPink),
                      ),
                      child: const Text('Detalhes'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
