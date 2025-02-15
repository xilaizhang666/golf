import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf/pages/event/create_event_page.dart';
import 'package:golf/pages/event/event_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/event.dart';

class EventPage extends StatefulWidget {
  EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List currTournaments = [
    {"name": "Golf Tournament", "dates": "Nov 11-13", "winner": "Bob", "prize": "400"},
    {"name": "Golf Tournament 2", "dates": "Nov 12-13", "winner": "Hanwen", "prize": "500"},
    {"name": "Golf Tournament 3", "dates": "Nov 11-14", "winner": "Dehao", "prize": "350"},
  ];

  List nextTournaments = [
    {"name": "Golf Tournament", "dates": "Dec 6-7", "winner": "Nicklous", "prize": "450"},
    {"name": "Golf Tournament 2", "dates": "Dec 12-13", "winner": "Davis", "prize": "350"},
    {"name": "Golf Tournament 3", "dates": "Dec 28-29", "winner": "Jacob", "prize": "400"},
  ];

  List<Event> events = [];
  @override
  void initState() {
    super.initState();

  }

  Future<void> fetchEvents()  async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    List<String> csvEvents = sf.getStringList("events") ?? [];
    setState(() {
      events = csvEvents.map((csv)=>Event.fromCsv(csv)).toList();
    });
  }

  Widget buildEventSection(BuildContext context, String title, List<Event> events) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        children: events.map((item) {
          return ListTile(
            title: Text(item.name,),
            subtitle: Text(item.date),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetailPage(
                event: item,
              )));
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventPage"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/logo.png',
                height: 150.0,
              ),
            ),
            buildEventSection(context, "Current Tournaments", events),
            buildEventSection(context, "Upcoming Tournaments", events),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateEventPage()))
          .then((onValue)=>fetchEvents());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
//For homework: Create an event detail page that simply contains a scaffold and an appbar that says "Event details". Then, apply navigation code to make the ontap open up this pag.