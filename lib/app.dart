import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/blocs/navigationBar/navigation_bar_bloc.dart';
import 'package:flutter_counter_bloc/pages/tabbar_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBarBloc>(
            create: (BuildContext context) => NavigationBarBloc(),
          ),
          BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(),
          ),
        ],
        child: TabBarPage(),
      ),
    );
  }
}
