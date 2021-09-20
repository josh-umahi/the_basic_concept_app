import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'products_cubit.dart';

part 'shop_screen_page_state.dart';

/// This cubit's sole purpose is to cause a reload in the shop
/// screen page when we navigate from the cart screen back to the
/// shop screen
class ShopScreenPageCubit extends Cubit<ShopScreenPageState> {
  ShopScreenPageCubit() : super(ShopScreenPageState());

  registerProductsCubit(ProductsCubit productsCubit) {
    emit(state.copyWith(productsCubit: productsCubit));
  }

  registerCategoryTag(String categoryTag) {
    emit(state.copyWith(categoryTag: categoryTag));
  }

  reloadPage() {
    final productsCubit = state.productsCubit;
    final categoryTag = state.categoryTag;
    if (productsCubit != null && categoryTag != null) {
      productsCubit.getProducts(categoryTag);
    } else {
      /// for debugging reasons
      print("Page could not be reloaded");
      print("productsCubit: $productsCubit and categoryTag: $categoryTag");
    }
  }
}
