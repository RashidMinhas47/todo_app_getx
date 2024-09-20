class Todo {
  String title;
  String subtitle;
  bool isDone;

  Todo({
    required this.title,
    required this.subtitle,
    this.isDone = false,
  });

  // Convert to map for storage
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'isDone': isDone,
    };
  }

  // Convert from map to Todo
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      subtitle: json['subtitle'],
      isDone: json['isDone'],
    );
  }
}

class TaskTodo {
  String title;
  String subtitle;
  bool isCompleted;

  TaskTodo({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  });

  // Convert a TaskTodo to a map for storage
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'isCompleted': isCompleted,
    };
  }

  // Convert a map to a TaskTodo object
  factory TaskTodo.fromJson(Map<String, dynamic> json) {
    return TaskTodo(
      title: json['title'],
      subtitle: json['subtitle'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}
