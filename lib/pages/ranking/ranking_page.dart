import 'package:flutter/material.dart';
import 'package:golf/models/player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

class RankingPage extends StatefulWidget {
  RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  List<Player> players = [];
  @override
  void initState() {
    super.initState();
    fetchPlayers();
  }

  Future<void> fetchPlayers() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    List<String> csvPlayers = sf.getStringList("players") ?? [];
    List<Player> playersList =
        csvPlayers.map((csv) => Player.fromCsv(csv)).toList();
    playersList.sort((a, b) => b.averageScore.compareTo(a.averageScore));
    setState(() {
      players = playersList;
    });
  }

  Future<void> addPlayer() async {
    final index = players.indexWhere((player)=>player.name==nameController.text);
    if(index == -1) {
      Player player = Player(
          name: nameController.text,
          averageScore: double.parse(scoreController.text),
          games: 1);
      players.add(player);
    } else {
      final player = players[index];
      final score = double.parse(scoreController.text);
      player.averageScore = (player.averageScore * player.games + score) / (player.games + 1);
      player.games += 1;
      players[index] = player;
    }

    setState(() {
      nameController.clear();
      scoreController.clear();
    });
    SharedPreferences sf = await SharedPreferences.getInstance();
    List<String> csvList = players.map((player) => player.toCsv()).toList();
    sf.setStringList("players", csvList);
    fetchPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("RankingPage"),
      ),
      body: Column(
        children: [
          DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              columns: [
                DataColumn(label: Text("Rank")),
                DataColumn(label: Text("Player")),
                DataColumn(label: Text("Score")),
                DataColumn(label: Text("Games")),
              ],
              rows: players.mapIndexed((index, player) {
                return DataRow(cells: [
                  DataCell(Text((index + 1).toString())),
                  DataCell(Text(player.name)),
                  DataCell(Text(player.averageScore.toStringAsFixed(1))),
                  DataCell(Text(player.games.toString())),
                ]);
              }).toList()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: scoreController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Score")),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addPlayer,
        child: Icon(Icons.add),
      ),
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       children: [
      //         FutureBuilder(
      //           future: http.get(Uri.parse("http://10.0.2.2:5000/explore")),
      //           builder: (context, snapshot){
      //             return Text(
      //                 snapshot.hasData ? snapshot.data!.body : 'Loading...',
      //               style: TextStyle(
      //                 fontSize: 20
      //               ),
      //             );
      //           }
      //         ),
      //         SizedBox(height: 20,),
      //         FutureBuilder(
      //             future: http.get(Uri.parse("http://10.0.2.2:5000/test2")),
      //             builder: (context, snapshot){
      //               return Text(
      //                   snapshot.hasData ? snapshot.data!.body : 'Loading...',
      //                 style: TextStyle(
      //                   fontSize: 20
      //                 ),
      //               );
      //             }
      //         ),
      //       ],
      //     ),
      //   )
      // ),
    );
  }
}
