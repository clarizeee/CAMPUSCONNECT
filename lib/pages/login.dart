import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practiceidk/models/event.dart';
import 'package:practiceidk/styles.dart';
import 'package:practiceidk/widgets/widgets.dart';
import 'package:practiceidk/pages/homepage.dart';


class LoginPage extends StatefulWidget {
  // list of favorited events

  const LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController emailVal = TextEditingController();
  final TextEditingController passVal = TextEditingController();
  @override
  Widget build(BuildContext context) {
   // final events = widget.favorites.where((e) => e.favorite == 1).toList();
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("CAMPUS CONNECT", style: ats.heading1,)),
            SizedBox(height: 5),
            TextField(
              controller: emailVal,
              
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "example@example.com",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passVal,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      side: BorderSide(color: c.border, width: 3)
                    )
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Homepage()),
                  );
                },
                child: const Text("Login", style: ats.body,),
                            ),
              ),
          ],
        ),
        
        )
    
    );
  }
}
