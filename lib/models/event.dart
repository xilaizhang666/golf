class Event{
  String name;
  String date;
  String time;
  String description;
  Event({
    required this.name,
    required this.date,
    required this.time,
    required this.description,
  });
  String toCsv(){
    return "$name,$date,$time,$description";
  }
  factory Event.fromCsv(String csv){
    final parts = csv.split(",");
    return Event(
      name: parts[0],
      date: parts[1],
      time: parts[2],
      description: parts[3],
    );
  }
}