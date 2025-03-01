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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Event: ${event.name}",
              style: textTheme.titleLarge,
            ),
            SizedBox(height: 8,),
            Text(
              "Date: ${event.date}",
              style: textTheme.titleMedium
            ),
            SizedBox(height: 8,),
            Text(
              "Time: ${event.time}",
              style: textTheme.titleMedium,
            ),
            SizedBox(height: 8,),
            Text(
              event.description,
              style: textTheme.titleMedium
            )
          ],
        ),
      ),

    );
  }
}
