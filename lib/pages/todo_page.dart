import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  //text controller
  final _controller = TextEditingController();
  //list of todo task
  List todos = [
    ["Design use case page", false],
    ["Code the interface", true],
  ];

  //when the checkbox is tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  //save new task method
  void saveNewTask() {
    setState(() {
      todos.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            fieldController: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete methode goes here
  void deleteFunction(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To Do'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: todos[index][0],
              isCompleted: todos[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteTask: () => deleteFunction(index),
            );
          }),
    );
  }
}
