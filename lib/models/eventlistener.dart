import 'package:flutter/material.dart';
import 'package:practiceidk/models/event.dart';

class EventStore extends ChangeNotifier {
  List<Event> events = [];

  // set the list of events (after fetching)
  void setEvents(List<Event> newEvents) {
    events = newEvents;
    notifyListeners();
  }

  // toggle favorite
  void toggleFavorite(Event event) {
    event.favorite = event.favorite == 1 ? 0 : 1;
    notifyListeners();
  }

  // get today's events
  List<Event> get todaysEvents {
    final today = DateTime.now();
    final todayString =
        "${today.year.toString().padLeft(4, '0')}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    return events.where((e) => e.date.startsWith(todayString)).toList();
  }

  // get all favorites
  List<Event> get favorites => events.where((e) => e.favorite == 1).toList();
}
