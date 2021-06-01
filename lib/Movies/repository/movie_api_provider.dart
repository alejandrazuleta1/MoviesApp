import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:inject/inject.dart';
import 'package:movie_app/Movies/model/movie_list.dart';
import 'package:movie_app/Movies/model/state.dart';

class MovieApiProvider {
  final Client client;
  final _apiKey = "b5a668eb2e2920afdf1a4d034433a4be";
  final _baseUrl = "https://api.themoviedb.org/3/movie";

  @provide
  MovieApiProvider(this.client);

  Future<State> fetchMovieList() async {
    Response response = await client.get("$_baseUrl/top_rated?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return State<MovieList>.success(MovieList.fromJson(json.decode(response.body)));
    } else {
      return State<String>.error(response.statusCode.toString());
    }
  }

}
