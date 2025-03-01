import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();


  String? gender;
  Future<void> saveProfile() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString("name", nameController.text);
    await sf.setString("age", ageController.text);
    await sf.setString("gender", gender.toString());
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
              'assets/Unknown.png',
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
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Age")
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Gender'
                ),
                value: gender,
                items: ["Male", "Female"].map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    gender = newValue;
                  });
                },
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
