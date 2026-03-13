import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practiceidk/models/event.dart';
import 'package:practiceidk/styles.dart';
import 'package:practiceidk/widgets/widgets.dart';
import 'package:practiceidk/pages/homepage.dart' as home;

class ProfilePage extends StatefulWidget {
  // list of favorited events

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // final events = widget.favorites.where((e) => e.favorite == 1).toList();
    return Scaffold();
  }
}
