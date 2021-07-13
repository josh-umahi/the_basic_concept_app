part of '../cart_screen.dart';

class CartItem extends StatelessWidget {
  final Product product;
  const CartItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: ourPaddingVertical),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: ourDarkGrey),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 95,
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    product.imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitle(product.title),
                    ProductPrice(product.price),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          BlocProvider<ProductQuantityCubit>(
            create: (_) => ProductQuantityCubit(
              id: product.id,
              categoryTag: product.categoryTag,
              cartCubit: context.read<CartCubit>(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemQuantity(width: 170),
                GestureDetector(
                  onTap: () =>
                      context.read<ProductQuantityCubit>().replaceQuantity(0),
                  child: Text(
                    "REMOVE ITEM",
                    style: TextStyle(
                      color: ourDarkGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
