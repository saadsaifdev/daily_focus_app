class TaskModel {
  final String id;
  final String title;
  final String subtitle;
  final String priority; // 'HIGH', 'MEDIUM', 'LOW'
  final String category; // 'Work', 'Personal', 'Design', etc.
  final String time;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.priority,
    required this.category,
    required this.time,
    this.isCompleted = false,
  });
}
