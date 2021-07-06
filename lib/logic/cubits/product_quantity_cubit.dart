import 'package:bloc/bloc.dart';

class ProductQuantityCubit extends Cubit<int> {
  ProductQuantityCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state != 0) {
      emit(state - 1);
    }
  }
}
