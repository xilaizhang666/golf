import 'package:flutter/material.dart';
import 'package:golf/theme.dart';

class EventDetailPage extends StatelessWidget {
  final String name;
  final String date;
  final String winner;
  final String prize;
  const EventDetailPage({super.key, required this.name, required this.date, required this.winner, required this.prize});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            name
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tournament: $name",
              style: textTheme.titleMedium,
            ),
            SizedBox(height: 8,),
            Text(
              "Dates: $date",
              style: textTheme.bodyMedium
            ),
            SizedBox(height: 8,),
            Text(
              "Previous Winner: $winner",
              style: textTheme.bodyMedium,
            ),
            SizedBox(height: 8,),
            Text(
              "Prize: \$$prize",
              style: textTheme.bodyMedium
            )
          ],
        ),
      ),

    );
  }
}
