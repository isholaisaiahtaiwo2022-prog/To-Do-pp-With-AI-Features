class Task {
  final String id;
  String title;
  bool isDone;

  Task({
    required this.id, 
    required this.title, 
    required this.isDone});

  Map<String, dynamic> toJson() => {
    'id': id, 
    'title': title, 
    'isDone': isDone};

  factory Task.fromJson(Map<String, dynamic> json) =>
      Task(id: json['id'], 
      title: json['title'], 
      isDone: json['isDone'] ?? false
    );
}
