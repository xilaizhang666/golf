import 'package:flutter/material.dart';
import 'package:golf/pages/record_page.dart';

class GrowthPage extends StatelessWidget {
  const GrowthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Growth Screen"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
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
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Keep up the good work!",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ExpansionTile(
                  title: Text("Games"),
                  children: [ListTile(title: Text("Game 1"))],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ExpansionTile(
                  title: Text("Equipment"),
                  children: [ListTile(title: Text("Club"))],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ExpansionTile(
                  title: Text("Practices"),
                  children: [ListTile(title: Text("Practice 1"))],
                ),
              ),
            ),
          ],
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
