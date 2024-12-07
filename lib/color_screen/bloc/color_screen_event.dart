part of 'color_screen_bloc.dart';

 class ColorScreenEvent {}

 class OnColorChangeEvent extends ColorScreenEvent{
  Color Newcolor;
OnColorChangeEvent({required this.Newcolor});
 }
