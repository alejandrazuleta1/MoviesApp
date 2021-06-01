import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Movies/bloc/movies_bloc.dart';
import 'package:movie_app/Movies/model/movie_list.dart';
import 'package:movie_app/Movies/ui/widgets/movie_item.dart';
import 'package:movie_app/Movies/ui/widgets/segmented_control.dart';

class HomeMovies extends StatefulWidget {
  final MoviesBloc _bloc;

  HomeMovies(this._bloc);

  @override
  State<StatefulWidget> createState() {
    return HomeMoviesState();
  }
}

class HomeMoviesState extends State<HomeMovies> {

  @override
  void initState() {
    super.initState();
    widget._bloc.init();
    widget._bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Movies'),
      ),
      body: StreamBuilder(
      stream: widget._bloc.allMovies,
      builder: (context, AsyncSnapshot<MovieList> snapshot) {
        if (snapshot.hasData) {
          return gridView(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget gridView(AsyncSnapshot<MovieList> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: MovieItem(
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index]
                      .poster_path}'),
              onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
        });
  }

    openDetailPage(MovieList data, int index) {
      Navigator.pushNamed(context, 'movieDetail', arguments: data.results[index]);
    }
}