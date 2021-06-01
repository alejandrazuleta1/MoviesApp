import 'package:inject/inject.dart';
import 'package:movie_app/Movies/movies_app.dart';
import 'bloc_injector.inject.dart' as g;
import 'bloc_module.dart';

@Injector(const [BlocModule])
abstract class BlocInjector{
  @provide
  MoviesApp get app;

  static final create = g.BlocInjector$Injector.create;
}