

import 'package:bloc_statemanagement_sample/fakestore_screen/model/fakestore_model.dart';
import 'package:equatable/equatable.dart';

class FakestoreState extends Equatable {
  const FakestoreState();
  
  @override
  List<Object> get props => [];
}

final class FakestoreInitial extends FakestoreState {}

final class FakestoreLoadingState extends FakestoreState {}

final class FakestoreSuccessState extends FakestoreState {
  List<Fakestoremodel>productslist;
  FakestoreSuccessState({required this.productslist});
   @override
  List<Object> get props => [productslist];

}

final class FakestoreFailedState extends FakestoreState {}

final class FakestoreExcepationState extends FakestoreState {}
