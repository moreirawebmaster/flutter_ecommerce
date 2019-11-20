import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/home/home_bloc.dart';
import 'package:flutter_ecommerce/home/home_page.dart';

void main() => runApp(
      BlocProvider(
        blocs: <Bloc>[
          Bloc((i) => HomeBloc()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomePage());
  }
}
