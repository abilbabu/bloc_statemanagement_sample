import 'package:bloc_statemanagement_sample/color_screen/bloc/color_screen_bloc.dart';
import 'package:bloc_statemanagement_sample/fakestore_screen/bloc/fakestore_bloc.dart';
import 'package:bloc_statemanagement_sample/fakestore_screen/bloc/fakestore_event.dart';
import 'package:bloc_statemanagement_sample/home_screen/bloc/home_screen_bloc.dart';
import 'package:bloc_statemanagement_sample/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => HomeScreenBloc(),
    ),
    BlocProvider(
      create: (context) => ColorScreenBloc(),
    ),
    BlocProvider(
        create: (context) => FakestoreBloc()..add(FetchProductEvent())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
