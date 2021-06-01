import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:movie_app/Movies/ui/screens/home_movies.dart';
import 'package:movie_app/Movies/ui/widgets/segmented_control.dart';

import 'bloc/movies_bloc.dart';

class MoviesApp extends StatelessWidget {
  final MoviesBloc moviesBloc;

  @provide
  MoviesApp(this.moviesBloc) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeMovies(moviesBloc)
      },
    );
  }

}