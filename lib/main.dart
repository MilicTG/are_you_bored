import 'package:are_you_bored/ui/screens/home_screen.dart';
import 'package:are_you_bored/ui/theme/bored_theme.dart';
import 'package:are_you_bored/ui/theme/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    boredTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AreYouBored?',
      home: const HomeScreen(),
      theme: BoredTheme.boredLightTheme,
      darkTheme: BoredTheme.boredDarkTheme,
      themeMode: boredTheme.currentTheme,
    );
  }
}
