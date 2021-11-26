import 'package:are_you_bored/model/activity_model.dart';
import 'package:are_you_bored/util/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<ActivityModel> getActivityFromApi() async {
  final response =
      await http.get(Uri.parse(Constants.BASE_LINK + Constants.ACTIVITY_ROUTE));

  if (response.statusCode == 200) {
    return ActivityModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to get data");
  }
}
