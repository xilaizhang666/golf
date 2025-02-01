class Player{
  String name;
  double averageScore;
  int games;
  Player({
    required this.name,
    required this.averageScore,
    required this.games
  });
  String toCsv(){
    return "$name,$averageScore,$games";
  }
  factory Player.fromCsv(String csv){
    final parts = csv.split(",");
    return Player(
        name: parts[0],
        averageScore: double.parse(parts[1]),
        games: int.parse(parts[2]),
    );
  }
}