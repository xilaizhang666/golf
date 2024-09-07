import 'package:flutter/material.dart';
import 'package:golf/pages/event_detail.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});
  List<String> greetings = [
    "Hi",
    "Hello",
    "Good Morning",
    "Congrats",
    "Farewell"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventPage"),
      ),
      body: Card(
        child: ExpansionTile(
          title: Text("Events"),
          children: greetings.map((item) {
            return ListTile(
              leading: Text(
                item,
                style: TextStyle(fontSize: 40),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetail(name: item,)));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
//For homework: Create an event detail page that simply contains a scaffold and an appbar that says "Event details". Then, apply navigation code to make the ontap open up this pag.