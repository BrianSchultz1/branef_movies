import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/colors_standard.dart';
import '../services/api_service.dart';
import 'movie_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: _movies(),
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

  Widget _movies() {
    return FutureBuilder<MovieDetails?>(
      future:
          getMovieDetails(6), // Substitua "movieId" pelo ID do filme desejado
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Exibe um indicador de carregamento enquanto os detalhes estão sendo buscados
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Exibe uma mensagem de erro caso ocorra um erro ao buscar os detalhes
          return Text('Erro: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Exibe os detalhes do filme
          final movieDetails = snapshot.data!;
          return Column(
            children: [
              const SizedBox(height: 30),
              _movieItem(movieDetails.title,
                  '${movieDetails.releaseYear} | ${movieDetails.duration} min'),
              const SizedBox(height: 30),
              // Adicione mais _movieItem() para exibir outros filmes
            ],
          );
        } else {
          return const Text('Detalhes do filme não encontrados');
        }
      },
    );
  }

  Widget _movieItem(String title, String details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: whiteColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              details,
              style: const TextStyle(
                color: whiteColor,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(secondaryPink),
              ),
              child: const Text('Detalhes'),
            ),
          ],
        ),
      ],
    );
  }
}
