
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/colors.dart';
import '../../gen/assets.gen.dart';
import '../notification/notification_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';
import 'home_screen.dart';

class HomePage extends ConsumerWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(HomeScreen.routename)) {
      return 0;
    }
    if (location.startsWith(SearchScreen.routename)) {
      return 1;
    }
    if (location.startsWith(NotificationScreen.routename)) {
      return 2;
    }
    if (location.startsWith(ProfileScreen.routename)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(HomeScreen.routename);
        break;
      case 1:
        GoRouter.of(context).go(SearchScreen.routename);
        break;
      case 2:
        GoRouter.of(context).go(NotificationScreen.routename);
        break;
      case 3:
        GoRouter.of(context).go(ProfileScreen.routename);
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        body: SafeArea(child: child),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: NavigationBar(
            backgroundColor: AppColors.parrotGreen,
            selectedIndex: _calculateSelectedIndex(context),
            onDestinationSelected: (index) => _onItemTapped(index, context),
            destinations: [
              NavigationDestination(
                label: 'Home',
                icon: Assets.icons.homeUnselected.image(),
                selectedIcon: Assets.icons.homeSelected.image(),
              ),
              NavigationDestination(
                label: 'Search',
                icon: Assets.icons.searchUnselected.image(),
                selectedIcon: Assets.icons.searchSelected.image(),
              ),
              NavigationDestination(
                label: 'Notifications',
                icon: Assets.icons.bellUnselected.image(),
                selectedIcon: Assets.icons.bellSelected.image(),
              ),
              NavigationDestination(
                label: 'Profile',
                icon: Assets.icons.profileUnselected.image(),
                selectedIcon: Assets.icons.profileSelected.image(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
