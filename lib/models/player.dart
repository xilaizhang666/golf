class Player{
  String name;
  double averageScore;
  Player({
    required this.name,
    required this.averageScore,
  });
  String toCsv(){
    return "$name,$averageScore";
  }
  factory Player.fromCsv(String csv){
    final parts = csv.split(","); //"Bob,12" -> ["Bob","12",]
    return Player(name: parts[0], averageScore: double.parse(parts[1]));
  }
}