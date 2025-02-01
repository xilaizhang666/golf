import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordRanking extends StatelessWidget {
  RecordRanking({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  Future<void> saveScore(BuildContext context) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    List<String> scoreList = sf.getStringList(nameController.text) ?? [];
    scoreList.add(scoreController.text);
    await sf.setStringList(nameController.text, scoreList);
    Navigator.of(context).pop();
  }
  /*
  {
    key: value
    Davis: [75, 72, 88],
    Nick: [88, 64]
  }
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
        "Record Score"
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
              controller: scoreController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Score")
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                saveScore(context);
              },
              child: Text("Save")
          )
        ],
      ),
    );
  }
}
