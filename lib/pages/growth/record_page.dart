import 'package:flutter/material.dart';
import 'package:golf/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  Future<void> addNewGame(BuildContext context) async{
    final gameController = TextEditingController();
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("New Game"),
        content: TextField(
          controller: gameController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "enter game details",
            border: OutlineInputBorder()
          ),
        ),
        actions: [
          TextButton(onPressed: () async{
            SharedPreferences sf = await SharedPreferences.getInstance();
            List<String> gameList = sf.getStringList("games") ?? [];
            gameList.add(gameController.text);
            await sf.setStringList("games", gameList);
            Navigator.of(context).pop();
          }, child: Text("Add"))
        ],
      );
    });
  }
  Future<void> addNewEquipment(BuildContext context) async{
    final equipmentController = TextEditingController();
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("New Equipment"),
        content: TextField(
          controller: equipmentController,
          maxLines: 5,
          decoration: InputDecoration(
              hintText: "enter equipment details",
              border: OutlineInputBorder()
          ),
        ),
        actions: [
          TextButton(onPressed: () async{
            SharedPreferences sf = await SharedPreferences.getInstance();
            List<String> equipmentList = sf.getStringList("equipment") ?? [];
            equipmentList.add(equipmentController.text);
            await sf.setStringList("equipment", equipmentList);
            Navigator.of(context).pop();
          }, child: Text("Add"))
        ],
      );
    });
  }
  Future<void> addNewPractice(BuildContext context) async{
    final practiceController = TextEditingController();
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("New Practice"),
        content: TextField(
          controller: practiceController,
          maxLines: 5,
          decoration: InputDecoration(
              hintText: "enter practice details",
              border: OutlineInputBorder()
          ),
        ),
        actions: [
          TextButton(onPressed: () async{
            SharedPreferences sf = await SharedPreferences.getInstance();
            List<String> practiceList = sf.getStringList("practices") ?? [];
            practiceList.add(practiceController.text);
            await sf.setStringList("practices", practiceList);
            Navigator.of(context).pop();
          }, child: Text("Add"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Record"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Games",
                  style: textTheme.titleSmall
                ),
                ElevatedButton(
                    onPressed: (){
                      addNewGame(context);
                    },
                    child: Text("+ New Game")
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Equipments",
                  style: textTheme.titleSmall
                ),
                ElevatedButton(
                    onPressed: (){
                      addNewEquipment(context);
                    },
                    child: Text("+ New Equipment")
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Practices",
                  style: textTheme.titleSmall
                ),
                ElevatedButton(
                    onPressed: (){
                      addNewPractice(context);
                    },
                    child: Text("+ New Practice")
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
