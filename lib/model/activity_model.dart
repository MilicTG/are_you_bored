import 'dart:convert';

class ActivityModel {
  final String activity;
  final String type;
  final num participants;
  final num price;
  final String link;
  final String key;
  final num accessibility;
  ActivityModel({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  ActivityModel copyWith({
    String? activity,
    String? type,
    num? participants,
    num? price,
    String? link,
    String? key,
    num? accessibility,
  }) {
    return ActivityModel(
      activity: activity ?? this.activity,
      type: type ?? this.type,
      participants: participants ?? this.participants,
      price: price ?? this.price,
      link: link ?? this.link,
      key: key ?? this.key,
      accessibility: accessibility ?? this.accessibility,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility,
    };
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      activity: json['activity'],
      type: json['type'],
      participants: json['participants'],
      price: json['price'],
      link: json['link'],
      key: json['key'],
      accessibility: json['accessibility'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ActivityModel(activity: $activity, type: $type, participants: $participants, price: $price, link: $link, key: $key, accessibility: $accessibility)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActivityModel &&
        other.activity == activity &&
        other.type == type &&
        other.participants == participants &&
        other.price == price &&
        other.link == link &&
        other.key == key &&
        other.accessibility == accessibility;
  }

  @override
  int get hashCode {
    return activity.hashCode ^
        type.hashCode ^
        participants.hashCode ^
        price.hashCode ^
        link.hashCode ^
        key.hashCode ^
        accessibility.hashCode;
  }
}
