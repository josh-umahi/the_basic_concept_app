part of '../shop_screen.dart';

class TopPicksListed extends StatelessWidget {
  final List<Product> products;
  const TopPicksListed(this.products);

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final productsLength = products.length;

    return Padding(
      padding: const EdgeInsets.only(
        top: ourPaddingVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: productsLength,
            itemBuilder: (context, i, pageViewIndex) {
              return Column(
                children: [
                  TopPicksImage(products[i].imageURL),
                  SizedBox(height: 16),
                  TopPicksItemDetails(products[i], cartCubit),
                ],
              );
            },
            options: CarouselOptions(
              height: topPicksImageHeight * 1.4,
              enableInfiniteScroll: false,
              reverse: true, // Just because I like the last image better
              initialPage: productsLength - 1,
            ),
          ),
        ],
      ),
    );
  }
}
