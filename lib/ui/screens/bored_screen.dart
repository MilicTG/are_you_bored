import 'package:are_you_bored/ui/theme/bored_colors.dart';
import 'package:flutter/material.dart';

class BoredScreen extends StatelessWidget {
  const BoredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: BoredColors.accentColorLight,
      child: const Text("bored"),
    );
  }
}
