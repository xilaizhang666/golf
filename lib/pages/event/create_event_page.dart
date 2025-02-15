import 'package:flutter/material.dart';
import 'package:golf/models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateEventPage extends StatelessWidget {
  CreateEventPage({super.key});
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> createEvent() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    List<String> csvEvents = sf.getStringList("events") ?? [];
    Event newEvent = Event(
        name: nameController.text,
        date: dateController.text,
        time: timeController.text,
        description: descriptionController.text
    );
    csvEvents.add(newEvent.toCsv());
    sf.setStringList("events", csvEvents);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Create Event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name")
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Date"),
                prefixIcon: Icon(Icons.calendar_today)
              ),
              onTap: () =>_selectDate(context),
            ),
            SizedBox(height: 12),
            TextField(
              controller: timeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Time")
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Description")
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: (){
                  createEvent();
                  Navigator.of(context).pop();
                },
                child: Text("Create")
            )
          ],
        ),
      ),
    );
  }
}
