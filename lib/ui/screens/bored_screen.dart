import 'package:are_you_bored/data/api/fetch_activity_from_api.dart';
import 'package:are_you_bored/model/activity_model.dart';
import 'package:are_you_bored/ui/theme/bored_colors.dart';
import 'package:are_you_bored/widgets/bored_card.dart';
import 'package:flutter/material.dart';

class BoredScreen extends StatefulWidget {
  const BoredScreen({Key? key}) : super(key: key);

  @override
  State<BoredScreen> createState() => _BoredScreenState();
}

class _BoredScreenState extends State<BoredScreen> {
  late Future<ActivityModel> _activityResponse;

  @override
  void initState() {
    super.initState();
    _activityResponse = getActivityFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: BoredColors.accentColorLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: FutureBuilder<ActivityModel>(
                  future: _activityResponse,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();

                      case ConnectionState.none:
                        return const CircularProgressIndicator();

                      case ConnectionState.active:
                        return const CircularProgressIndicator();

                      case ConnectionState.done:
                        return BoredCard(
                          boredIdea: snapshot.data!.activity,
                          boredType: snapshot.data!.type,
                          boredParticipnts: snapshot.data!.participants,
                          boredPrice: snapshot.data!.price.round(),
                          onSwipe: _onSwipeCard,
                        );
                      default:
                        if (snapshot.hasData) {
                          return BoredCard(
                            boredIdea: snapshot.data!.activity,
                            boredType: snapshot.data!.type,
                            boredParticipnts: snapshot.data!.participants,
                            boredPrice: snapshot.data!.price.round(),
                            onSwipe: _onSwipeCard,
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _onSwipeCard,
                  foregroundColor: BoredColors.accentColorLight,
                  elevation: 10.0,
                  child: const Icon(
                    Icons.thumb_down,
                    color: BoredColors.onPrimaryColorDark,
                    size: 28.0,
                  ),
                ),
                FloatingActionButton(
                  onPressed: _onSwipeCard,
                  foregroundColor: BoredColors.accentColorLight,
                  elevation: 10.0,
                  child: const Icon(
                    Icons.thumb_up,
                    color: BoredColors.onPrimaryColorDark,
                    size: 28.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    );
  }

  void _onSwipeCard() {
    setState(() {
      _activityResponse = getActivityFromApi();
    });
  }
}
