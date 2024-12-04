// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  String Title;
  bool isCompleted;
  Task({
    required this.Title,
    required this.isCompleted,
  });

  void isDone() {
    isCompleted = !isCompleted;
  }
}
