part of '../shop_screen.dart';

class ProductCategoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          final products = state.products;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: ourPaddingHorizontal,
              vertical: ourPaddingVertical,
            ),
            itemCount: products.length,
            itemBuilder: (context, i) {
              return ShopItem(products[i]);
            },
          );
        } else if (state is ProductsLoading) {
          return Column(
            children: [
              LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                color: Colors.black,
                minHeight: linearIndicatorHeight,
              ),
            ],
          );
        } else {
          return ErrorContainer();
        }
      },
    );
  }
}

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_sharp,
            color: Colors.orange[800],
          ),
          SizedBox(height: 5),
          Text(
            "NO NETWORK CONNECTION",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange[800],
            ),
          ),
        ],
      ),
    );
  }
}
