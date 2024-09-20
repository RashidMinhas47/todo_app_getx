import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/todo_model.dart';
import '../views/home_view.dart';

class TodoController extends GetxController {
  RxList<Todo> todos = <Todo>[].obs; // Reactive list of ToDos
  final storage = GetStorage();
  var titleTextCtr = TextEditingController().obs;
  var subtitleTextCtr = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  // Load todos from GetStorage
  void loadTodos() {
    List<dynamic> storedTodos = storage.read<List<dynamic>>('todos') ?? [];
    todos.value = storedTodos.map((e) => Todo.fromJson(e)).toList();
  }

  // Add a new ToDo
  void addTodo(String title,String subtitle) {
    todos.add(Todo(title: title,subtitle: subtitle));
    saveTodos();
    Get.off(()=>const HomeView());

  }

  // Mark a ToDo as done/undone
  void toggleTodoStatus(int index) {
    var todo = todos[index];
    todos[index] = Todo(
      title: todo.title,
      subtitle: todo.subtitle,
      isDone: !todo.isDone,
    );
    saveTodos();
  }

  // Delete a ToDo
  void deleteTodo(int index) {
    todos.removeAt(index);
    saveTodos();
  }

  // Save todos to GetStorage
  void saveTodos() {
    List<Map<String, dynamic>> jsonTodos = todos.map((e) => e.toJson()).toList();
    storage.write('todos', jsonTodos);
  }
}

class TaskTodoCtr extends GetxController {
  final storage = GetStorage();
  RxList<TaskTodo> todos = <TaskTodo>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  // Load todos from GetStorage
  void loadTodos() {
    List<dynamic> storedTodos = storage.read<List<dynamic>>("todos") ?? [];
    todos.value = storedTodos.map((e) => TaskTodo.fromJson(e)).toList();
    update(); // Force update after loading todos
  }

  // Add a new ToDo
  void addTodo(String title, String subtitle) {
    todos.add(TaskTodo(title: title, subtitle: subtitle));
    saveTodo();
  }

  // Delete a ToDo
  void deleteTodo(int index) {
    todos.removeAt(index); // Simplified delete
    saveTodo();
  }

  // Toggle ToDo completion status
  void toggleTodo(int index) {
    TaskTodo todo = todos[index];
    todos[index] = TaskTodo(
      title: todo.title,
      subtitle: todo.subtitle,
      isCompleted: !todo.isCompleted, // Flip isCompleted state
    );
    saveTodo();
  }

  // Save todos to GetStorage
  void saveTodo() {
    List<Map<String, dynamic>> jsonTodos = todos.map((e) => e.toJson()).toList();
    storage.write('todos', jsonTodos);
  }
}

// class TaskTodoCtr extends GetxController{
//   final storage = GetStorage();
//   RxList<TaskTodo> todos = <TaskTodo>[].obs;
//  @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     loadTodos();
//   }
//
//
//   void loadTodos(){
//     List<dynamic> storedTodos = storage.read<List<dynamic>>("todos") ?? [];
//     todos.value = storedTodos.map((e)=> TaskTodo.fromJson(e)).toList();
//   }
//  void addTodo(String title, String subtitle){
//    todos.add(TaskTodo(title: title, subtitle: subtitle));
//    saveTodo();
//  }
//  void deleteTodo(int index){
//    final todo = todos[index];
//    todos.remove(todo);
//    saveTodo();
//  }
//  void toggleTodo(index){
//    final todo = todos[index];
//    todo.isCompleted = !todo.isCompleted;
//    saveTodo();
//  }
//  void saveTodo(){
//    List<Map<String,dynamic>> jsonTodos = todos.map((e)=> e.toJson()).toList();
//    storage.write('todos', jsonTodos);
//  }
//
// }
