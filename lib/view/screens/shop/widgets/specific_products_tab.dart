part of '../shop_screen.dart';

class SpecificProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          final products = state.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              return ShopItem(products[i]);
            },
          );
        } else if (state is ProductsLoading) {
          return Column(
            children: [
              LinearProgressIndicator(
                backgroundColor: ourLightGrey,
                color: Colors.black,
                minHeight: 1.25,
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
