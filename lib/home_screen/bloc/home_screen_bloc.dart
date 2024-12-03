import 'package:bloc/bloc.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState()) {
    on<onIncrementEvent>((event, emit) {
     emit(HomeScreenState(count: ++state.count));
    });

    on<onDecrementEvent>((event, emit) {
     emit(HomeScreenState(count: --state.count));
    });
  }
}
