import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practiceidk/models/event.dart';
import 'package:practiceidk/styles.dart';
import 'package:practiceidk/pages/eventdetails.dart';
import 'package:practiceidk/main.dart';

class CardDisplayer extends StatefulWidget {
  final Event event;
  final bool enabler; 
  const CardDisplayer({super.key, required this.event, required this.enabler});

  @override
  State<CardDisplayer> createState() => _CardDisplayerState();
}

class _CardDisplayerState extends State<CardDisplayer> {
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () {
        Navigator.push(context,
         MaterialPageRoute(builder: (_) => EventDetailsPage(event: widget.event, enabler: widget.enabler,)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: c.border, width: 2), // visible border
     boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],     
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // important to prevent overflow
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.network(
                 widget.event.thumbnail,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover, // makes sure it scales properly
                ),
                Positioned(
                  top: 10,
                  left: 10, 
                  child: 
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    
                    child: Text(widget.event.date.substring(5), style: ats.caption,))
                  )
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Column for name + location
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.name,
                        style: ats.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              widget.event.location,
                              style: ats.body,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Heart button
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.event.favorite = (widget.event.favorite + 1) % 2;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: widget.event.favorite == 1 ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget DescDisplay(String CategoryName, String Content) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
    
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: c.border, width: 3)
      
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(CategoryName, style: ats.body,),
        SizedBox(height: 5,),
        Text(Content, style: ats.caption,)
      ],
    ),
  );
}



Widget iconwhatever(IconData iconname, String whatever) {
  return  Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              padding: EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
              
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: c.border, width: 3)
              ),
              child: 
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(iconname),
                  SizedBox(width: 10,),
                  Text(
                    whatever,
                    style: ats.body,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
                 ),
            );
}


Widget listDisplayer(IconData iconname, String whatever) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
    padding: EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),

    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: c.border, width: 3),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconname),
        SizedBox(width: 10),
        Text(
          whatever,
          style: ats.body,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

