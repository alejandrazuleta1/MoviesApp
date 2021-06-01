import 'package:movie_app/Movies/model/movie_list.dart';
import 'package:movie_app/Movies/model/state.dart';
import 'package:movie_app/Movies/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:inject/inject.dart';
import 'bloc_base.dart';

class MoviesBloc extends BlocBase {
  final Repository _repository;
  PublishSubject<MovieList> _moviesFetcher;

  @provide
  MoviesBloc(this._repository);

  init() {
    _moviesFetcher = PublishSubject<MovieList>();
  }

  Observable<MovieList> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    State state = await _repository.fetchAllMovies();
    if (state is SuccessState) {
      _moviesFetcher.sink.add(state.value);
    } else if (state is ErrorState) {
      _moviesFetcher.addError(state.msg);
    }
  }

  @override
  dispose() {
    _moviesFetcher.close();
  }
}
