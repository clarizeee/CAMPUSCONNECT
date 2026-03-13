import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practiceidk/models/event.dart';
import 'package:practiceidk/styles.dart';
import 'package:practiceidk/widgets/widgets.dart';

class EventDetailsPage extends StatefulWidget {
  final Event event; 
  final bool enabler; 
  const EventDetailsPage({super.key, required this.event, required this.enabler});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: 
      Padding(
        padding: EdgeInsets.only(bottom: 10, right: 10),
        child: 
        SizedBox(
          width: 70,
          height: 70,
          child: widget.enabler ? FloatingActionButton(
            onPressed: () {
              setState((){
                widget.event.favorite = (widget.event.favorite + 1) % 2;
              });
            },
            child: Icon(Icons.favorite, size: 45, color: widget.event.favorite == 1 ? Colors.red : Colors.black,),
            ) : Visibility(visible: false, child: FloatingActionButton(onPressed: () {} )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text("Event details"),
        automaticallyImplyLeading: true, // default is true
      ),
      body: SingleChildScrollView(
        
        child: Column(
          
          children: [
            Image.network(
                 widget.event.thumbnail,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover, // makes sure it scales properly
                ),
            Center(child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
              child:  Text(widget.event.name, style: ats.heading1,),)),
            iconwhatever(Icons.calendar_month, widget.event.date),
            iconwhatever(Icons.location_on, widget.event.location),
            DescDisplay("Organizer", widget.event.organizer),
            
            DescDisplay("Description", widget.event.description),
  
          ],
        ),
      ),
    );
    
  }
}