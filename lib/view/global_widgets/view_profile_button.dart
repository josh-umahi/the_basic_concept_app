import 'package:flutter/material.dart';

import '../../constant.dart';
import 'my_profile_pop_up_card.dart';
import 'view_profile_modal_route.dart';

class ViewProfileButton extends StatelessWidget {
  const ViewProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        ViewProfileModalRoute(
          builder: (_) => const MyProfilePopUpCard(),
        ),
      ),
      child: const Icon(
        Icons.account_circle_outlined,
        size: appBarLeftActionSize,
        color: Colors.black,
      ),
    );
  }
}
