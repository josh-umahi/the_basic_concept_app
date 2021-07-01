part of '../shop_screen.dart';

class HeaderTabBar extends StatefulWidget {
  @override
  _HeaderTabBarState createState() => _HeaderTabBarState();
}

class _HeaderTabBarState extends State<HeaderTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final tabTitles = [
    "Top",
    "Apparel",
    "Bowls",
    "Beds and Houses",
    "Collars",
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: ourDarkGrey,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: ourPaddingHorizontal,
      ),
      isScrollable: true,
      tabs: _buildTabs(),
    );
  }

  List<Tab> _buildTabs() {
    return tabTitles
        .map(
          (tabTitle) => Tab(
            child: Text(
              tabTitle,
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
        .toList();
  }
}