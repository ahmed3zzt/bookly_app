import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly/features/splash/presentation/views/widgets/author_page.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../splash/presentation/views/this_feature_in_future.dart';

class HomeViewBodyBuilder extends StatelessWidget {
  const HomeViewBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return homeBuilder();
  }

  Widget homeBuilder() {
    return FloatingNavBar(
      resizeToAvoidBottomInset: false,
      color: kPrimaryColor,
      borderRadius: 30.0,
      selectedIconColor: Colors.white,
      unselectedIconColor: Colors.white.withOpacity(0.6),
      items: [
        FloatingNavBarItem(
          iconData: UniconsLine.home,
          page: const HomeViewBody(),
          title: 'Home',
        ),
        FloatingNavBarItem(
          iconData: UniconsLine.bookmark,
          page: const InFutureFeature(),
          title: 'Favorite',
        ),
        FloatingNavBarItem(
          iconData: UniconsLine.play,
          page: const InFutureFeature(),
          title: 'Playlist',
        ),
        FloatingNavBarItem(
          iconData: UniconsLine.user,
          page: const AuthorView(),
          title: 'Profile',
        ),
      ],
      horizontalPadding: 62.0,
      hapticFeedback: true,
    );
  }
}
