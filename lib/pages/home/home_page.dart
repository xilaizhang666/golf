import 'package:flutter/material.dart';
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
