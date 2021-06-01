import 'package:inject/inject.dart';
import 'package:http/http.dart' show Client;
import 'package:movie_app/Movies/bloc/bloc_base.dart';
import 'package:movie_app/Movies/bloc/movies_bloc.dart';
import 'package:movie_app/Movies/repository/movie_api_provider.dart';
import 'package:movie_app/Movies/repository/repository.dart';

@module
class BlocModule{

  @provide
  @singleton
  Client client() => Client();

  @provide
  @singleton
  MovieApiProvider movieApiProvider(Client client) => MovieApiProvider(client);

  @provide
  @singleton
  Repository repository(MovieApiProvider movieApiProvider) => Repository(movieApiProvider);

  @provide
  BlocBase movieBloc(Repository repository) => MoviesBloc(repository);

  //@provide
  //BlocBase movieDetailBloc(Repository repository) => MovieDetailBloc(repository);
}