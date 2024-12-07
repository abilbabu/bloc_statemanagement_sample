import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'color_screen_event.dart';
part 'color_screen_state.dart';

class ColorScreenBloc extends Bloc<OnColorChangeEvent, ColorScreenState> {
  ColorScreenBloc() : super(ColorScreenInitial()) {
    on<OnColorChangeEvent>((event, emit) {
      emit(ColorScreenState(Scaffoldcolor: event.Newcolor));
    });
  }
}
