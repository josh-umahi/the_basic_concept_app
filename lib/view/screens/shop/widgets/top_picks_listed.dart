part of '../shop_screen.dart';

class TopPicksListed extends StatelessWidget {
  final List<Product> products;
  const TopPicksListed(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return Padding(
      padding: const EdgeInsets.only(
        top: ourPaddingVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: products.map((product) {
              return Column(
                children: [
                  TopPicksImage(product.imageURL),
                  const SizedBox(height: 16),
                  TopPicksItemDetails(product, cartCubit),
                ],
              );
            }).toList(growable: false),
            options: CarouselOptions(
              height: topPicksImageHeight * 1.4,
              enableInfiniteScroll: false,
              reverse: true, // Just because I find the last image gorgeous
              initialPage: products.length - 1,
            ),
          ),
        ],
      ),
    );
  }
}
