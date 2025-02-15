import 'package:flutter/material.dart';
import 'package:golf/models/event.dart';
import 'package:golf/theme.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;
  const EventDetailPage({super.key, required this.event});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            event.name
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Event: ${event.name}",
              style: textTheme.titleMedium,
            ),
            SizedBox(height: 8,),
            Text(
              "Date: ${event.date}",
              style: textTheme.bodyMedium
            ),
            SizedBox(height: 8,),
            Text(
              "Time: ${event.time}",
              style: textTheme.bodyMedium,
            ),
            SizedBox(height: 8,),
            Text(
              event.description,
              style: textTheme.bodyMedium
            )
          ],
        ),
      ),

    );
  }
}
