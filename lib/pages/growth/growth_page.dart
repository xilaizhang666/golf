import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:golf/pages/growth/record_page.dart';
import 'package:golf/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GrowthPage extends StatefulWidget {
  const GrowthPage({super.key});

  @override
  State<GrowthPage> createState() => _GrowthPageState();
}

class _GrowthPageState extends State<GrowthPage> {
  List<String> games = [];
  List<String> equipment = [];
  List<String> practices = [];
  @override
  void initState() {
    super.initState();
    loadGames();
    loadEquipment();
    loadPractices();
  }
  Future<void> loadGames() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      games = sf.getStringList("games") ?? [];
    });
  }
  Future<void> loadEquipment() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      equipment = sf.getStringList("equipment") ?? [];
    });
  }
  Future<void> loadPractices() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      practices = sf.getStringList("practices") ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Growth Screen"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 300.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Level 1",
                  style: textTheme.bodyLarge
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Keep up the good work!",
                  style: textTheme.bodyLarge
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ExpansionTile(
                    title: Text("Games"),
                    children: games.map((game){
                      return ListTile(title: Text(game));
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ExpansionTile(
                    title: Text("Equipment"),
                    children: equipment.map((item){
                      return ListTile(title: Text(item));
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ExpansionTile(
                    title: Text("Practices"),
                    children: practices.map((practice){
                      return ListTile(title: Text(practice));
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RecordPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
