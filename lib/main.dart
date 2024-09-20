import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'views/home_view.dart';

void main() async {
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App (MVVM + GetX)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomeView(),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// void main() {
//   GetStorage.init();
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:const Text("Todo Bar"),
//       ),
//     );
//   }
// }
// class AskTodo{
//   String title;
//   String subtitle;
//   bool status;
//   AskTodo({required this.title,required this.subtitle, this.status = false});
//   Map<String,dynamic> toJson(){
//     return {
//       'title': title,
//       'subtitle': subtitle,
//       'status': status,
//     };
//   }
//   factory AskTodo.fromJson(Map<String,dynamic> json){
//     return AskTodo(title: json['title'], subtitle: json["subtitle"], status: json["status"]);
//   }
// }
// class TaskTodo {
//   String title;
//   String subtitle;
//   bool isCompleted;
//   TaskTodo({required this.title, required this.subtitle, this.isCompleted = false});
//   Map<String,dynamic>  toJson(){
//     return {
//       'title':title,
//       'subtitle': subtitle,
//       'isCompleted': isCompleted,
//     };
//   }
//   factory TaskTodo.fromJson(Map<String,dynamic> json){
//     return TaskTodo(title: json['title'], subtitle: json['subtitle'],isCompleted: json['isCompleted']);
//   }
// }
