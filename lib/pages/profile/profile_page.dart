import 'package:flutter/material.dart';
import 'package:golf/pages/profile/edit_profile.dart';
import 'package:golf/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "";
  String age = "";
  String gender = "Unknown";

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
      gender = sf.getString("gender") ?? "Unknown";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
            'assets/$gender.png',
            height: 300.0,
          ),
          Text(
            "Name: $name",
            style: textTheme.titleLarge
          ),
          Text(
            "Age: $age",
            style: textTheme.titleLarge
          ),
          Text(
            "Gender: $gender",
            style: textTheme.titleLarge
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile()))
                .then((onValue){
                  loadProfile();
                });
              },
              child: Text("Edit Profile")
          ),

        ],),
      ),
    );
  }
}
