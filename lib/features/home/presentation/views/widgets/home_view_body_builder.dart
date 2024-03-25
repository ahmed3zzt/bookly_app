import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class HomeViewBodyBuilder extends StatelessWidget {
  const HomeViewBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == ConnectivityResult.none) {
              return offlineBuilder(context);
            } else {
              return homeBuilder();
            }
          } else {
            return loadingBuilder(context);
          }
        });
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
          page: const HomeViewBody(),
          title: 'Favorite',
        ),
        FloatingNavBarItem(
          iconData: UniconsLine.play,
          page: const HomeViewBody(),
          title: 'Playlist',
        ),
        FloatingNavBarItem(
          iconData: UniconsLine.user,
          page: const HomeViewBody(),
          title: 'Profile',
        ),
      ],
      horizontalPadding: 62.0,
      hapticFeedback: true,
    );
  }

  Widget offlineBuilder(context) {
    return Scaffold(
      body: Center(
        child: Text('No Internet Connection Available',
            style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }

  Widget loadingBuilder(context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 20,
          ),
          Text('Check Network Connection'),
        ],
      ),
    );
  }
}
