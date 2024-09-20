// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/todo_controller.dart';
//
// class HomeView extends StatelessWidget {
//
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TodoController todoController = Get.put(TodoController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ToDo App (GetX + MVVM)'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() => ListView.builder(
//               itemCount: todoController.todos.length,
//               itemBuilder: (context, index) {
//                 var todo = todoController.todos[index];
//                 return ListTile(
//                   title: Text(
//                     todo.title,
//                     style: TextStyle(
//                       decoration: todo.isDone
//                           ? TextDecoration.lineThrough
//                           : TextDecoration.none,
//                     ),
//                   ),
//                   leading: Checkbox(
//                     value: todo.isDone,
//                     onChanged: (value) {
//                       todoController.toggleTodoStatus(index);
//                     },
//                   ),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       todoController.deleteTodo(index);
//                     },
//                   ),
//                 );
//               },
//             )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onSubmitted: (value) {
//                 if (value.isNotEmpty) {
//                   todoController.addTodo(value);
//                 }
//               },
//               decoration: InputDecoration(
//                 labelText: 'Add ToDo',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';

import '../controllers/todo_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin{
  late final AnimationController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    final todoCtr = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: todoCtr.todos.length,
                itemBuilder: (_, i) {
                  final todo = todoCtr.todos[i];
                  return ListTile(
                    leading: Checkbox(
                      onChanged: (value) {
                        todoCtr.toggleTodoStatus(i);
                      },
                      value: todo.isDone,
                    ),
                    title: Text(
                      todo.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      todo.subtitle,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: IconButton(onPressed: ()=>
                      todoCtr.deleteTodo(i),
                    icon:const Icon(Icons.delete),),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> HomeFus.showMyDialog( context,controller: _controller, titleCtr: todoCtr.titleTextCtr.value,subtitleCtr: todoCtr.subtitleTextCtr.value,todo: todoCtr),

      child: Icon(Icons.add_task), ),
    );
  }
}


class HomeFus{
 static Future<void> showMyDialog(BuildContext context,{required AnimationController controller,required TextEditingController titleCtr, required TextEditingController subtitleCtr,required TodoController todo}){
  return  showDialog(context: context,builder: (context)=>Dialog(
      // height: 400,
      // width: 400,
      child: Container(
        height: 390,
        width: 390,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add Your Task",style:Theme.of(context).textTheme.headlineLarge),
              Container(
                width: 380,
                height: 70,
                child: TextFormField(
                  controller: titleCtr,
                  decoration: InputDecoration(
                      hintText: "Enter title.",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Container(
                width: 380,
                height: 70,
                child: TextFormField(
                  controller: subtitleCtr,
                  decoration: InputDecoration(
                      hintText: "Enter subtitle.",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              TextButton(onPressed: (){
                controller
                  ..duration = const Duration(seconds: 1)
                  ..forward();
Future.delayed(const Duration(seconds: 2),(){
  todo.addTodo(titleCtr.text,subtitleCtr.text);

});
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add"),
                  // if(icon)
                  //   icon,
                  Lottie.asset('assets/animations/msg_send_ani.json',controller: controller),

                ],
              ),style: TextButton.styleFrom(
                  fixedSize: const Size(390, 49),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side:const BorderSide(width: 2,color: Colors.grey))
              ),)
            ],
          ),
        ),
      ),
    ));
  }
}