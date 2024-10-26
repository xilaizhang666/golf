import 'package:flutter/material.dart';
import 'package:golf/pages/edit_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "";
  String age = "";

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      name = sf.getString("name") ?? "Unknown";
      age = sf.getString("age") ?? "0";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
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
          Text(
            "Name: $name",
            style: TextStyle(
                fontSize: 30,
            ),
          ),
          Text(
            "Age: $age",
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
      ),
    );
  }
}
