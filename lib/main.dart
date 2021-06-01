import 'package:flutter/material.dart';
import 'Movies/injector/bloc_injector.dart';
import 'Movies/injector/bloc_module.dart';

void main() async {
  var container = await BlocInjector.create(BlocModule());
  runApp(container.app);
}
