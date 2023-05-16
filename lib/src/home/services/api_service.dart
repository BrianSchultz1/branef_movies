import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screens/movie_det.dart';

Future<MovieDetails> getMovieDetails(int movieId, int perPage) async {
  const apiKey = '92617104f2646d905240d1f828861df6';
  final url = 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final movieDetails = MovieDetails(
      title: data['title'],
      releaseYear: data['release_year'],
      duration: data['duration'],
      rating: data['rating'],
    );
    return movieDetails;
  } else {
    throw Exception('Falha ao carregar os detalhes do filme');
  }
}
