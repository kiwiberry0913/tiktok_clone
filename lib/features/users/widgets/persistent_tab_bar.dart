import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: const TabBar(
        labelColor: Colors.black,
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size8,
        ),
        indicatorColor: Colors.black,
        indicatorPadding: EdgeInsets.symmetric(
          horizontal: Sizes.size72,
        ),
        tabs: [
          Icon(
            Icons.table_rows,
          ),
          FaIcon(
            FontAwesomeIcons.heart,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 44;

  @override
  double get minExtent => 44;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
