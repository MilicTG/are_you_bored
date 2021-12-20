import 'package:are_you_bored/data/local/open_database.dart';
import 'package:are_you_bored/ui/screens/home_screen.dart';
import 'package:are_you_bored/ui/theme/bored_colors.dart';
import 'package:are_you_bored/ui/theme/bored_theme.dart';
import 'package:are_you_bored/ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(const MyApp());
  getDatabase();
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: BoredColors.accentColorLight));

    return MaterialApp(
      title: 'AreYouBored?',
      home: const Scaffold(
        body: SafeArea(
          child: HomeScreen(),
        ),
      ),
      theme: BoredTheme.boredLightTheme,
      darkTheme: BoredTheme.boredDarkTheme,
      themeMode: boredTheme.currentTheme,
    );
  }
}
