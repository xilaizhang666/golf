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
  String? name;
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
    final index = players.indexWhere((player)=>player.name==name);
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

  Future<void> deletePlayer(int index) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    players.removeAt(index);
    List<String> csvList = players.map((player) => player.toCsv()).toList();
    sf.setStringList("players", csvList);
    setState(() {
      name = null;
    });
    fetchPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Rankings"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                columns: [
                  DataColumn(label: Text("Rank")),
                  DataColumn(label: Text("Player")),
                  DataColumn(label: Text("Score")),
                  DataColumn(label: Text("Games")),
                  DataColumn(label: Text("Delete")),
                ],
                rows: players.mapIndexed((index, player) {
                  return DataRow(cells: [
                    DataCell(Text((index + 1).toString())),
                    DataCell(Text(player.name)),
                    DataCell(Text(player.averageScore.toStringAsFixed(1))),
                    DataCell(Text(player.games.toString())),
                    DataCell(IconButton(
                      onPressed: (){
                        deletePlayer(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ))
                  ]);
                }).toList()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Name'
              ),
              value: name,
              items: players.map((player) {
                return DropdownMenuItem<String>(
                  value: player.name,
                  child: Text(player.name),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  name = newValue;
                });
              },
            ),
          ),
          name == null ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name")),
            ),
          ) : Container(),
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
    );
  }
}
