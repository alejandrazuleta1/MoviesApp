import 'dart:async';
import 'package:movie_app/Movies/model/state.dart';
import 'movie_api_provider.dart';
import 'package:inject/inject.dart';

class Repository {

  final MovieApiProvider _moviesApiProvider;

  @provide
  Repository(this._moviesApiProvider);

  Future<State> fetchAllMovies() => _moviesApiProvider.fetchMovieList();
}
