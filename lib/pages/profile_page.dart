import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        'assets/logo.png',
        height: 300.0,
      ),
      Text(
        "Name: Unknown",
        style: TextStyle(
            fontSize: 30,
        ),
      ),
      Text(
        "Age: 0",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      Text(
        "Gender: Unknown",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(
          onPressed: (){},
          child: Text("Edit Profile")
      ),

    ],);
  }
}
