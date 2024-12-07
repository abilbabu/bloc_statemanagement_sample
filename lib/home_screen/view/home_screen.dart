import 'package:bloc_statemanagement_sample/color_screen/view/color_screen.dart';
import 'package:bloc_statemanagement_sample/fakestore_screen/view/fakestore_screen.dart';
import 'package:bloc_statemanagement_sample/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeScreenBloc>().add(onIncrementEvent());
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ColorScreen(),
                    ));
              },
              icon: Icon(Icons.color_lens_outlined)),
              IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FakestoreScreen(),
                    ));
              },
              icon: Icon(Icons.shopify_rounded))
        ],
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          return Center(
            child: Text(state.count.toString()),
          );
        },
      ),
    );
  }
}
