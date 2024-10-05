import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name")
            ),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Age")
            ),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Gender")
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text("Save")
          ),


        ],
      ),
    );
  }
}
