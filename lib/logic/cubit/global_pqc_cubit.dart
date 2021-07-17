import 'package:bloc/bloc.dart';

import 'product_quantity_cubit.dart';

/// Global ProductQuantityCubits Cubit
///
/// This cubit ensures that the ProductQuantityCubit on the Shop Screen
/// and the Cart Screen are in sync. This will ensure that changes on the cart
/// are immediately reflected on the shop screen
class GlobalPQCsCubit extends Cubit<List<ProductQuantityCubit>> {
  GlobalPQCsCubit() : super([]);

  /// Deregister the cartSummaryCubit in all the productQuantityCubits
  /// contained in the state
  ///
  /// Should be used when the cartSummaryCubit is about to close
  void deregisterCartSummaryCubitInAll() {
    final productQuantityCubits = state;
    productQuantityCubits.forEach((productQuantityCubit) {
      productQuantityCubit.deregisterCartSummaryCubit();
    });
  }
}
