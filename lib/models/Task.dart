class Task {
  late String title;
  late String description;
  late bool check;

  Task({required this.title, required this.description, this.check = false});

  Task.empty() {
    title = "";
    description = "";
    check = false;
  }

  @override
  String toString() {
    return "$title -> $description -> $check";
  }
}
