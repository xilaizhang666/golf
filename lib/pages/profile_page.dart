import 'package:flutter/material.dart';
import 'package:golf/pages/edit_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile()));
            },
            child: Text("Edit Profile")
        ),

      ],),
    );
  }
}
