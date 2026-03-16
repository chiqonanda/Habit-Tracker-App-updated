class Habit {
  String id;
  String title;
  String description;
  String category;
  bool isCompleted;

  Habit({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isCompleted = false,
  });
}