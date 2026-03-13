import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practiceidk/models/event.dart';
import 'package:practiceidk/styles.dart';
import 'package:practiceidk/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:practiceidk/pages/favorites.dart';
import 'package:practiceidk/pages/login.dart';
import 'package:practiceidk/pages/profile.dart';
import 'package:practiceidk/pages/search.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _MainMenuState();
}

class _MainMenuState extends State<Homepage> {
  final TextEditingController _controller = TextEditingController();
  bool loading = true;
  List<Event> allEvents = [];
  List<Event> daata = [];
  @override
  void initState() {
    super.initState();
    fetchEventData();
  }
    List<Event> favorites = [];
    
  Future<List<Event>> fetchURIdata() async {
    final url = Uri.parse("https://7f57fd9e-1aa6-4668-b1be-222e22cb98e4.mock.pstmn.io/testing");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> list = data;
      return list.map((e) => Event.fromJson(e)).toList();

    } else {
      throw Exception("Failed to load events");
    }
  }
Future<List<Event>> fetchEventData() async {
    if (daata.isEmpty) {
      daata = await fetchURIdata();
    }
    return daata;
  }

Future <void> searchVal(inputt) async {
    if (daata.isEmpty) {
      await fetchEventData();
    }
    if (inputt != null && inputt.isNotEmpty) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage(result: daata, inputsa: inputt))).then((_) {
                        setState(() {
                          _controller.text = "";
                        }); }
                
      
    );
    }

}

  
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top:20, left:10),
          children: [
            ListTile(
              title: Text("Menu"),
            ),
            Divider(),
             ListTile(
              title: Text("Log Out"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
            ),

            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 20),
        title: Center(child: Text("CAMPUS CONNECT")),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            tooltip: "Open menu",
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
        IconButton(
                  onPressed:  () async {
                      
                      // pass only the favorited ev
                     await 
                     fetchEventData();
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FavoritesPage(favorites: daata),
                        )
                        
                      ).then((_) {
                        setState(() {
                          fetchEventData();
                        });
                      }); //setState(() {});
                    
                  },
                  icon: Icon(Icons.favorite),
                ),
        ],
      ),
      body: 
       FutureBuilder<List<Event>>(
        future: fetchEventData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No events found"));
          }

          final allEvents = snapshot.data!;
          final todayString = DateFormat("yyyy-MM-dd").format(DateTime.now());
          final todaysEvents = allEvents
              .where((e) => e.date.startsWith(todayString))
              .toList();

          return 
          SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: c.border, width: 3)
                  ),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                        searchVal(value);
                      },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: "Whats up?",
                      prefixIcon: IconButton(onPressed: () {
                        searchVal(_controller.text);
                      }, icon: Icon(Icons.search))
                    ),
                  ),
                ),
                // Today's Events
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  
                  child: Text(
                    "Today's Events",
                    style:ats.heading2,
                  ),
                ),
                todaysEvents.isEmpty
                    ? const Center(child: Text("No events today"))
                    : GridView.builder(
                      shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.75,
                            ),
                        itemCount: todaysEvents.length,
                        itemBuilder: (context, index) =>
                            CardDisplayer(event: todaysEvents[index], enabler: true,),
                      ),
            
                // All Events
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "All Events",
                    textAlign: TextAlign.left,
                    style: ats.heading2,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: allEvents.length,
                  itemBuilder: (context, index) =>
                      CardDisplayer(event: allEvents[index], enabler: true,),
                ),
              ],
            ),
          );
        },
      ),
    );
    
  }
}
