import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/save_task.dart';
import 'package:todo_app/models/task_model.dart';

class HomePage extends StatelessWidget {
  final _controller = TextEditingController();
  HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                height: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none, // No border
                          hintText: "What's on your mind?",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFC6CFDC),
                          ), // Placeholder text
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            context.read<SaveTask>().addTask(
                                  Task(
                                      Title: _controller.text,
                                      isCompleted: false),
                                );
                            _controller.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Create",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF007FFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<SaveTask>(
        builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  task.tasks[index].Title,
                  style: TextStyle(
                    decoration: task.tasks[index].isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Wrap(
                  children: [
                    Checkbox(
                      value: task.tasks[index].isCompleted,
                      onChanged: (_) {
                        context.read<SaveTask>().checkTask(index);
                      },
                      activeColor: const Color(0xFFC6CFDC),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<SaveTask>().removeTask(
                              task.tasks[index],
                            );
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
