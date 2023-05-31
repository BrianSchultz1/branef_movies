import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

//organnizar state do bloc
class AppState extends Equatable {
  final int movies;
  final bool isLoading;

  const AppState({required this.movies, required this.isLoading});

  factory AppState.initial() {
    return const AppState(movies: 0, isLoading: false);
  }

  AppState copyWith({int? movies, bool? isLoading}) {
    return AppState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [movies, isLoading];
}

abstract class ClientState {
  List<Client> clients;

  ClientState({
    required this.clients,
  });
}

// class ClientInitialState extends CLientState {
//     lientInitial()
// }