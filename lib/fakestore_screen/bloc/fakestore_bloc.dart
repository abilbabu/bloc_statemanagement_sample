import 'package:bloc_statemanagement_sample/fakestore_screen/bloc/fakestore_event.dart';
import 'package:bloc_statemanagement_sample/fakestore_screen/bloc/fakestore_state.dart';
import 'package:bloc_statemanagement_sample/fakestore_screen/model/fakestore_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class FakestoreBloc extends Bloc<FakestoreEvent, FakestoreState> {
  FakestoreBloc() : super(FakestoreInitial()) {
    on<FetchProductEvent>((event, emit) async {
      final url = Uri.parse("https://fakestoreapi.com/products");

      // loading state
      emit(FakestoreLoadingState());
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          //successful State
          emit(FakestoreSuccessState(
              productslist: fakestoremodelFromJson(response.body)));
        } else {
          // api failed state
          emit(FakestoreFailedState());
        }
      } catch (e) {
        // excepation state
        emit(FakestoreExcepationState());
      }
    });
  }
}
