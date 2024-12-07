import 'package:bloc_statemanagement_sample/color_screen/bloc/color_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> myColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.black,
      Colors.purple,
    ];

    return BlocBuilder<ColorScreenBloc, ColorScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.Scaffoldcolor,
          appBar: AppBar(
            backgroundColor: state.Scaffoldcolor,
          ),
          body: Center(
            child: ListView.separated(
                padding: EdgeInsets.all(14),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        context.read<ColorScreenBloc>().add(OnColorChangeEvent(
                              Newcolor: myColors[index],
                            ));
                      },
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: myColors[index],
                            border: Border.all(color: Colors.white, width: 2)),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: myColors.length),
          ),
        );
      },
    );
  }
}
