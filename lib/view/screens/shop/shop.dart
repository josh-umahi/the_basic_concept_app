
// class ShopScreen extends StatefulWidget {
//   @override
//   _ShopScreenState createState() => _ShopScreenState();
// }

// ///
// ///Change ListView to ListView.builder
// ///
// class _ShopScreenState extends State<ShopScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.dark,
//         child: ListView(
//           padding: const EdgeInsets.symmetric(vertical: 60),
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: ourPaddingHorizontal,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Icon(
//                     Icons.account_circle_outlined,
//                     size: 33,
//                     color: Colors.black,
//                   ),
//                   Spacer(),
//                   Icon(
//                     Icons.search,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                   SizedBox(width: 22),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.shopping_cart,
//                       size: 25,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 25),
//             Padding(
//               padding: const EdgeInsets.only(left: ourPaddingHorizontal),
//               child: Text(
//                 'Top Picks',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontFamily: "Nunito",
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),
//             HeaderTabBar(),
//             SizedBox(height: 15),
//             Xysssseds(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Xysssseds extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ListView(
//           // scrollDirection: Axis.horizontal,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   width: 314,
//                   height: 456,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Image.asset(
//                     "assets/images/a.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         SizedBox(height: 18),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 47,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Organic Raglan Baseball Sleeve / Black",
//                 textAlign: TextAlign.left,
//                 style: productTitleStyle,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               Text(
//                 "\$36.00",
//                 textAlign: TextAlign.left,
//                 style: productPriceStyle,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class HeaderTabBar extends StatefulWidget {
//   @override
//   _HeaderTabBarState createState() => _HeaderTabBarState();
// }

// class _HeaderTabBarState extends State<HeaderTabBar>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final tabTitles = [
//     "Top",
//     "Apparel",
//     "Bowls",
//     "Beds and Houses",
//     "Collars",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController =
//         TabController(initialIndex: 0, length: tabTitles.length, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TabBar(
//       controller: _tabController,
//       labelColor: Colors.black,
//       indicatorColor: Colors.transparent,
//       unselectedLabelColor: ourDarkGrey,
//       labelPadding: const EdgeInsets.symmetric(
//         horizontal: ourPaddingHorizontal,
//       ),
//       isScrollable: true,
//       tabs: _buildTabs(),
//     );
//   }

//   List<Tab> _buildTabs() {
//     return tabTitles
//         .map(
//           (tabTitle) => Tab(
//             child: Text(
//               tabTitle,
//               style: TextStyle(
//                 fontFamily: "Nunito",
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         )
//         .toList();
//   }
// }
