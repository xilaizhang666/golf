import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf/pages/event/create_event_page.dart';
import 'package:golf/pages/event/event_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

import '../../models/event.dart';
import '../../theme.dart';

class EventPage extends StatefulWidget {
  EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {


  List<Event> events = [];
  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents()  async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    List<String> csvEvents = sf.getStringList("events") ?? [];
    setState(() {
      events = csvEvents.map((csv)=>Event.fromCsv(csv)).toList();
    });
  }

  Future<void> deleteEvent(int index) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    List<String> csvEvents = sf.getStringList("events") ?? [];
    csvEvents.removeAt(index);
    sf.setStringList("events", csvEvents);
    fetchEvents();
  }

  Widget buildEventSection(BuildContext context, List<Event> events) {
    print(events);
    return Column(
      children: events.mapIndexed ((index, event){
        return Card(
          child: ListTile(
            title: Text(event.name,),
            subtitle: Text(event.date),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetailPage(
                event: event,
              )));
            },
            trailing: IconButton(
              onPressed: (){
                deleteEvent(index);
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/Unknown.png',
                height: 150.0,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Current Tournaments",
              style: textTheme.titleSmall,
            ),
            buildEventSection(context, events),
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