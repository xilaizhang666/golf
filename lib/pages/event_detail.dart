import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  final String name;
  const EventDetail({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "event details"
        ),
      ),
      body: Text(
        name
      ),
    );
  }
}
