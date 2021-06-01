import 'bloc_injector.dart' as _i1;
import 'bloc_module.dart' as _i2;
import 'package:http/http.dart' as _i3;
import '../repository/movie_api_provider.dart' as _i4;
import '../repository/repository.dart' as _i5;
import 'dart:async' as _i6;
import '../movies_app.dart' as _i7;
import '../bloc/movies_bloc.dart' as _i8;

class BlocInjector$Injector implements _i1.BlocInjector {
  BlocInjector$Injector._(this._blocModule);

  final _i2.BlocModule _blocModule;

  _i3.Client _singletonClient;

  _i4.MovieApiProvider _singletonMovieApiProvider;

  _i5.Repository _singletonRepository;

  static _i6.Future<_i1.BlocInjector> create(_i2.BlocModule blocModule) async {
    final injector = BlocInjector$Injector._(blocModule);
    return injector;
  }

  _i7.MoviesApp _createApp() => _i7.MoviesApp(_createMoviesBloc());
  _i8.MoviesBloc _createMoviesBloc() => _i8.MoviesBloc(_createRepository());
  _i5.Repository _createRepository() => _singletonRepository ??= _blocModule.repository(_createMovieApiProvider());
  _i4.MovieApiProvider _createMovieApiProvider() => _singletonMovieApiProvider ??= _blocModule.movieApiProvider(_createClient());
  _i3.Client _createClient() => _singletonClient ??= _blocModule.client();

  @override
  _i7.MoviesApp get app => _createApp();
}
