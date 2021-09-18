part of '../shop_screen.dart';

class ShopTabBar extends StatelessWidget {
  final TabController tabController;
  final void Function() onTapEvent;
  const ShopTabBar({
    Key? key,
    required this.tabController,
    required this.onTapEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: ourDarkGrey,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: ourPaddingHorizontal * 0.75,
      ),
      isScrollable: true,
      tabs: _buildTabs(),
      onTap: (i) {
        onTapEvent();
        context
            .read<ShopScreenPageCubit>()
            .registerCategoryTag(tabCategories[i]);
      },
    );
  }

  List<Tab> _buildTabs() {
    return tabTitles
        .map(
          (tabTitle) => Tab(
            child: Text(
              tabTitle,
              style: const TextStyle(
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
