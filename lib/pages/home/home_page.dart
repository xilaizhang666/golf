import 'package:flutter/material.dart';
import 'package:golf/pages/event/event_detail_page.dart';
import 'package:golf/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              "Current Tournaments",
              style: textTheme.titleSmall
            ),
            Card(
              child: ListTile(
                title: Text("Golf Championship"),
                subtitle: Text("Nov 11-12"),
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => EventDetailPage(
                    name: "Golf Championship",
                    date: "Nov 11-12",
                    winner: "Xilai Zhang",
                    prize: "150",
                  )));
                },
              ),
              color: Colors.lightGreen,
            ),
          ],
        ),
      ),
    );
  }
}
