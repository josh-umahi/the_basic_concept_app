part of '../shop_screen.dart';

class ProductsListed extends StatelessWidget {
  final List<Product> products;
  const ProductsListed(this.products);

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: ourPaddingHorizontal,
        vertical: ourPaddingVertical,
      ),
      itemCount: products.length,
      itemBuilder: (context, i) {
        return ShopItem(products[i], cartCubit);
      },
    );
  }
}
