part of '../shop_screen.dart';

class TopPicksImage extends StatelessWidget {
  final String imageURL;
  const TopPicksImage(this.imageURL, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: topPicksImageWidth,
      height: topPicksImageHeight,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(imageURL, fit: BoxFit.cover),
      ),
    );
  }
}
