part of '../shop_screen.dart';

class ShopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 180,
            height: 180,
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
                'assets/images/a.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            height: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                ProductTitle("Greenery Dress", maxLines: 3),
                ProductPrice("\$36.00"),
                Spacer(),
                ItemQuantity(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
