import 'package:flutter/material.dart';
import 'package:golf/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';
import '../../models/event.dart';
import '../event/event_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  List<Event> events = [];
  @override
  void initState() {
    super.initState();
    loadProfile();
    fetchEvents();
  }
  Future<void> loadProfile() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      name = sf.getString("name") ?? "Unknown";
    });
  }
  Future<void> fetchEvents()  async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    List<String> csvEvents = sf.getStringList("events") ?? [];
    setState(() {
      events = csvEvents.map((csv)=>Event.fromCsv(csv)).toList();
    });
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
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page"
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
                "Welcome back, $name",
                style: textTheme.titleSmall
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
    );
  }
}
