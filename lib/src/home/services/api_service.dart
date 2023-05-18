import 'package:http/http.dart' as http;
import 'dart:convert';
import '../pages/movie_details_page.dart';

Future<MovieDetails?> getMovieDetails(int movieId) async {
  const apiKey = '82cf23d2188f966ff195559ba3b21c06';
  final url = 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final movieDetails = MovieDetails(
      id: data['id'],
      title: data['title'],
      releaseYear: int.parse(data['release_date'].substring(0, 4)),
      duration: int.parse(data['runtime'].toString()),
      rating: data['vote_average'].toDouble(),
      imageUrl: 'https://image.tmdb.org/t/p/w500/${data['poster_path']}',
      details: data[
          'overview'], // Exemplo de detalhe adicionado (usando o campo 'overview')
    );
    return movieDetails;
  } else {
    throw Exception('Falha ao carregar os detalhes do filme');
  }
}
