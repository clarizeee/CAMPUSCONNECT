import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practiceidk/models/event.dart';
import 'package:practiceidk/styles.dart';
import 'package:practiceidk/widgets/widgets.dart';
import 'package:practiceidk/pages/homepage.dart' as home;


class FavoritesPage extends StatefulWidget {
  final List<Event> favorites; // list of favorited events
  
  const FavoritesPage({super.key, required this.favorites});
  
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  @override
  Widget build(BuildContext context) {
    
    final events = widget.favorites.where((e) => e.favorite == 1).toList();
    return Scaffold(
      appBar: AppBar(title: Text("Favorites"),  automaticallyImplyLeading: true),
      body: events.isEmpty
          ? Center(child: Text("No favorites yet"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: events.length,
              itemBuilder: (context, index) => CardDisplayer(
                event: events[index], enabler: false,
              ),
            ),
    );
  }
}
