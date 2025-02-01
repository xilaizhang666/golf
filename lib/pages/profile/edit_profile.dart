import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  Future<void> saveProfile() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString("name", nameController.text);
    await sf.setString("age", ageController.text);
    await sf.setString("gender", genderController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
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
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name")
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Age")
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: genderController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Gender")
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  saveProfile().then((_) {
                    Navigator.pop(context, true);
                  });
                },
                child: Text("Save")
            ),
          ],
        ),
      ),
    );
  }
}
