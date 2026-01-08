class TaskModel {
  final String id;
  final String title;
  final String ownerId;
  final String ownerEmail;
  final List<String> users;
  final bool completed;

  TaskModel({
    required this.id,
    required this.title,
    required this.ownerId,
    required this.ownerEmail,
    required this.users,
    required this.completed,
  });

  factory TaskModel.fromMap(String id, Map<String, dynamic> data) {
    return TaskModel(
      id: id,
      title: data['title'],
      ownerId: data['ownerId'],
      ownerEmail: data['ownerEmail'],
      users: List<String>.from(data['users']),
      completed: data['completed'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'ownerId': ownerId,
      'ownerEmail': ownerEmail,
      'users': users,
      'completed': completed,
      'createdAt': DateTime.now(),
    };
  }
}
