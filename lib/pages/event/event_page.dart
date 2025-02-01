import 'package:flutter/material.dart';
import 'package:golf/pages/event/event_detail_page.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});
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
  Widget buildEventSection(BuildContext context, String title, List events) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        children: events.map((item) {
          return ListTile(
            title: Text(item["name"],),
            subtitle: Text(item["dates"]),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetailPage(
                name: item["name"],
                date: item["dates"],
                winner: item["winner"],
                prize: item["prize"],

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
            buildEventSection(context, "Current Tournaments", currTournaments),
            buildEventSection(context, "Upcoming Tournaments", nextTournaments),
          ],
        ),
      ),
    );
  }
}
//For homework: Create an event detail page that simply contains a scaffold and an appbar that says "Event details". Then, apply navigation code to make the ontap open up this pag.