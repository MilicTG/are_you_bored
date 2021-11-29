import 'package:flutter/material.dart';

class BoredCardInfoRow extends StatelessWidget {
  final String infoTitle;
  final String infoValue;

  const BoredCardInfoRow(
      {Key? key, required this.infoTitle, required this.infoValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              infoTitle,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              infoValue,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}
