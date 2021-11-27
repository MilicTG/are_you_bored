import 'package:are_you_bored/ui/screens/bored_screen.dart';
import 'package:are_you_bored/ui/screens/favorites_screen.dart';
import 'package:are_you_bored/ui/screens/settings_screen.dart';
import 'package:are_you_bored/ui/theme/bored_colors.dart';
import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavLayout(
      pages: [
        (_) => const FavoritesScreen(),
        (_) => const BoredScreen(),
        (_) => const SettingsScreen()
      ],
      bottomNavigationBar: (currentIndex, onTap) => BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => onTap(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_outlined), label: 'Bored'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        fixedColor: BoredColors.accentColorLight,
        backgroundColor: BoredColors.surfaceColorLight,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      savePageState: false,
      lazyLoadPages: false,
      // StandardPageStack, ReorderToFrontExceptFirstPageStack, NoPageStack, FirstAndLastPageStack
      pageStack: ReorderToFrontPageStack(initialPage: 1),
      extendBody: false,
      resizeToAvoidBottomInset: true,
    );
  }
}
