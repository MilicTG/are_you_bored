import 'package:are_you_bored/ui/theme/bored_theme.dart';
import 'package:are_you_bored/widgets/bored_card_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class BoredCard extends StatelessWidget {
  final String boredIdea;
  final String boredType;
  final num boredParticipnts;
  final num boredPrice;
  final Function onSwipe;

  const BoredCard({
    Key? key,
    required this.boredIdea,
    required this.boredType,
    required this.boredParticipnts,
    required this.boredPrice,
    required this.onSwipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      verticalSwipe: false,
      onSwipeLeft: (finalPosition) {
        onSwipe();
      },
      onSwipeRight: (finalPosition) {
        onSwipe();
      },
      child: Container(
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
              height: 64.0,
            ),
            BoredCardInfoRow(
              infoTitle: "Category:",
              infoValue: boredType,
            ),
            BoredCardInfoRow(
              infoTitle: "Participants:",
              infoValue: boredParticipnts.toString(),
            ),
            BoredCardInfoRow(
              infoTitle: "Price:",
              infoValue: boredPrice.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
