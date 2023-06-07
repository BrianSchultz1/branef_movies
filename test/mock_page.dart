import 'package:branef_movies/features/home/presentation/pages/movie_list.dart';
import 'package:branef_movies/features/movie_details/movie_details.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieDetails extends Mock implements MovieDetails {}

void main() {
  testWidgets('Testando MovieList', (WidgetTester tester) async {
    // Criação de objetos de teste para MovieDetails
    final movie1 = MockMovieDetails();
    final movie2 = MockMovieDetails();

    // Ccomportamentos esperados dos objetos de teste
    when(() => movie1.imageUrl)
        .thenReturn('https://example.com/movie1.jpg'); //exemplo somente
    when(() => movie1.title).thenReturn('Movie 1');
    when(() => movie1.rating).thenReturn(4.5);
    when(() => movie1.releaseYear).thenReturn(2021);
    when(() => movie1.duration).thenReturn(120);
    when(() => movie1.details).thenReturn('Movie 1 details');

    when(() => movie2.imageUrl).thenReturn('https://example.com/movie2.jpg');
    when(() => movie2.title).thenReturn('Movie 2');
    when(() => movie2.rating).thenReturn(3.8);
    when(() => movie2.releaseYear).thenReturn(2020);
    when(() => movie2.duration).thenReturn(105);
    when(() => movie2.details).thenReturn('Movie 2 details');

    // Objeto MovieList
    final movieList = MovieList();

    // Adição dos objetos de teste à lista movies
    movieList.addMovie(movie1);
    movieList.addMovie(movie2);

    // Renderização da lista de filmes
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => movieList.buildMoviesList(context),
      ),
    ));

    // Verificação dos elementos renderizados
    expect(find.text('Movie 1'), findsOneWidget);
    expect(find.text('Movie 2'), findsOneWidget);
    expect(find.text('Detalhes'), findsNWidgets(2));
  });
}
