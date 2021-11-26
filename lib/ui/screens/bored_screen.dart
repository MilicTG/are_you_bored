import 'package:are_you_bored/data/api/fetch_activity_from_api.dart';
import 'package:are_you_bored/model/activity_model.dart';
import 'package:are_you_bored/ui/theme/bored_colors.dart';
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
      child: FutureBuilder<ActivityModel>(
        future: _activityResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.activity);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
