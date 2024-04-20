class Task {
  late String id;
  late String title;
  late String description;
  late bool check;

  Task({required this.title, required this.description, this.check = false});

  Task.empty() {
    id = "";
    title = "";
    description = "";
    check = false;
  }

  Task.fromMap(Map<String, dynamic> map, String idTask)
      : title = map['title'] ?? "",
        description = map['description'] ?? '',
        check = map['check'] ?? '',
        id = idTask;

  toMap() {
    return {'title': title, 'description': description, 'check': check};
  }

  @override
  String toString() {
    return "$title -> $description -> $check";
  }
}
