import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practiceidk/models/event.dart';
import 'package:practiceidk/styles.dart';
import 'package:practiceidk/widgets/widgets.dart';
import 'package:practiceidk/pages/homepage.dart' as home;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), 
     // centerTitle: true
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 24),

            // Name section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(12),
             //   color: Colors.white,
              ),
              child: const Text(
                "Justine Clarize Ballarbare",
                style: ats.body,
              ),
            ),

            const SizedBox(height: 16),

            // Email section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(12),
                //color: Colors.white,
              ),
              child: const Text(
                "example@example.com",
                style: ats.body,
              ),
            ),

            const SizedBox(height: 16),

            // Other info section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(12),
               // color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Student ID: 123456"),
                  SizedBox(height: 8),
                  Text("Course: Computer Science"),
                  SizedBox(height: 8),
                  Text("Year: 2nd Year"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
