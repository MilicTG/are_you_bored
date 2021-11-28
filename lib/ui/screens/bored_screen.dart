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
                    if (snapshot.hasData) {
                      return BoredCard(
                        boredIdea: snapshot.data!.activity,
                        boredType: snapshot.data!.type,
                        boredParticipnts: snapshot.data!.participants,
                        boredPrice: snapshot.data!.price,
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
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
                ElevatedButton(
                  onPressed: () => {},
                  child: const Text("Dislike"),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: const Text("Like"),
                )
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
}
