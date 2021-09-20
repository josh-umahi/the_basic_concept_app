part of 'shop_screen_page_cubit.dart';

@immutable
class ShopScreenPageState extends Equatable {
  final ProductsCubit? productsCubit;
  final String? categoryTag;
  const ShopScreenPageState({this.productsCubit, this.categoryTag});

  ShopScreenPageState copyWith({
    ProductsCubit? productsCubit,
    String? categoryTag,
  }) {
    return ShopScreenPageState(
      productsCubit: productsCubit ?? this.productsCubit,
      categoryTag: categoryTag ?? this.categoryTag,
    );
  }

  @override
  List<Object> get props {
    if (productsCubit == null || categoryTag == null) {
      return [];
    } else {
      return [productsCubit!.state, categoryTag!];
    }
  }
}
