import 'package:are_you_bored/ui/theme/bored_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class BoredCard extends StatelessWidget {
  final String boredIdea;
  final String boredType;
  final num boredParticipnts;
  final num boredPrice;

  const BoredCard(
      {Key? key,
      required this.boredIdea,
      required this.boredType,
      required this.boredParticipnts,
      required this.boredPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      verticalSwipe: false,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3.0,
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            )
          ],
          color: BoredTheme.boredDarkTheme.cardColor,
        ),
        child: Column(
          children: [
            Text(
              boredIdea,
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                const Text("Category:"),
                const SizedBox(
                  width: 8.0,
                ),
                Text(boredType)
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const Text("Participants:"),
                const SizedBox(
                  width: 8.0,
                ),
                Text(boredParticipnts.toString())
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const Text("Price:"),
                const SizedBox(
                  width: 8.0,
                ),
                Text(boredPrice.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
