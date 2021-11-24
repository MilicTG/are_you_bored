import 'package:are_you_bored/ui/screens/bored_screen.dart';
import 'package:are_you_bored/ui/screens/favorites_screen.dart';
import 'package:are_you_bored/ui/screens/settings_screen.dart';
import 'package:are_you_bored/ui/theme/bored_colors.dart';
import 'package:flutter/material.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      color: BoredColors.primaryColorLight,
      index: 1,
      selectedIconColor: BoredColors.onPrimaryColorLight,
      unselectedIconColor: Colors.white.withOpacity(0.6),
      items: [
        FloatingNavBarItem(
            iconData: Icons.favorite_outline,
            page: const FavoritesScreen(),
            title: 'Favorites'),
        FloatingNavBarItem(
            iconData: Icons.person_add_alt_outlined,
            page: const BoredScreen(),
            title: 'Bored'),
        FloatingNavBarItem(
            iconData: Icons.settings,
            page: const SettingsScreen(),
            title: 'Settings'),
      ],
      horizontalPadding: 10.0,
      hapticFeedback: false,
      showTitle: false,
    );
  }
}
