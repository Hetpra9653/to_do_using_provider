class Task {
  final String id;
  final String title;
  final bool isCompleted;
  bool isFavourite; // Add this line

  Task({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.isFavourite = false, // Add this line
  });
}
