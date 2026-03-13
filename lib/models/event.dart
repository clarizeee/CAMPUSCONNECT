

import 'package:flutter/material.dart';
//handler for the  main event info
class Event {
  final String name;
  final String date;
  final String location;
  final String thumbnail;
  final String organizer;
  final String description;
  int favorite;

  Event({
    required this.name,
    required this.date,
    required this.thumbnail,
    required this.location,
    required this.organizer,
    required this.description,
    required this.favorite,
  });

  factory Event.fromJson(Map<String, dynamic>json) {
    return Event(
      name: json["name"],
      date: json["date"],
      thumbnail: json["thumbnail"],
      location: json["location"],
      organizer: json["organizer"],
      description: json["description"],
      favorite: json["favorite"],
    );
  }
}