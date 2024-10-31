import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/create_task_button.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();
  //list of todos
  List todos = [];
  //list of todos that are done
  List doneTodos = [];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBar(),
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: appBar(),
      body: _selectedIndex == 0
          ? (todos.isEmpty ? addTask() : listViewTodo())
          : listViewDone(), //addTask(),
    );
  }

//active todos
  ListView listViewTodo() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ToDoTile(
          taskName: todos[index][0],
          isCompleted: todos[index][1],
          onChanged: (value) => checkBoxChanged(value, index),
          deleteTask: () => deleteFunction(index),
        );
      },
    );
  }

  Column addTask() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //welcome text
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "Welcome, ",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF3F3D56),
                        fontWeight: FontWeight.bold)),
                TextSpan(
                  text: "John",
                  style: TextStyle(
                    color: Color(0xFF007FFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Create tasks to achieve more.",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFF8D9CB8),
                fontSize: 20),
          ),
        ),
        const Spacer(),
        Expanded(
          child: Center(
            child: Column(
              children: [
                //Image
                Image.asset(
                  "assets/images/addtask.png",
                  height: 100,
                ),
                const Text(
                  "You have no task listed.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Color(0xFF8D9CB8)),
                ),
                //button
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: createNewTask,
                  child: const CreateTaskButton(),
                )
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  NavigationBar navigationBar() {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 1) {
            createNewTask();
            _selectedIndex = 0;
          }
        });
      },
      surfaceTintColor: const Color(0xFFF5F7F9),
      shadowColor: const Color(0xFFC6CFDC),
      elevation: 4,
      height: 80,
      backgroundColor: const Color(0xFFFFFFFF),
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/todo.svg",
            colorFilter: ColorFilter.mode(
              _selectedIndex == 0
                  ? const Color(0xFF007FFF)
                  : const Color(0xFFC6CFDC),

              ///! Light gray color for unselected
              BlendMode.srcIn,
            ),
          ),
          label: "Todo",
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/create.svg",
            colorFilter: ColorFilter.mode(
              _selectedIndex == 1
                  ? const Color(0xFF007FFF)
                  : const Color(0xFFC6CFDC),

              ///! Light gray color for unselected
              BlendMode.srcIn,
            ),
          ),
          label: "Create",
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            colorFilter: ColorFilter.mode(
              _selectedIndex == 2
                  ? const Color(0xFF007FFF)
                  : const Color(0xFFC6CFDC),

              ///! Light gray color for unselected
              BlendMode.srcIn,
            ),
          ),
          label: "Search",
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/done.svg",
            colorFilter: ColorFilter.mode(
              _selectedIndex == 3
                  ? const Color(0xFF007FFF)
                  : const Color(0xFFC6CFDC),

              ///! Light gray color for unselected
              BlendMode.srcIn,
            ),
          ),
          label: "Done",
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 30,
              ),
              const SizedBox(width: 8),
              const Text(
                'Taski',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Row(
            children: [
              Text(
                'John',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 8),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/avatar.png',
                ), // Replace with your profile image asset
                radius: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  //modal bottom sheet
  // void _showCreateModal() {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: ((context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         child: Container(
  //           decoration: const BoxDecoration(
  //               color: Color(0xFFFFFFFF),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(12),
  //                 topRight: Radius.circular(12),
  //               )),
  //           height: 300,
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(12),
  //                 child: todoTextField(),
  //               ),
  //               //button
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   MaterialButton(
  //                     onPressed: () {},
  //                     child: const Text(
  //                       "Create",
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         color: Color(0xFF007FFF),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }

  void createNewTask() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
            height: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: todoTextField(),
                ),
                //button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (_controller.text.trim().isNotEmpty) {
                          saveNewTask();
                          _controller.clear(); //to clear the textfiel
                        } else {
                          // Show a snackbar or dialog to inform the user
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Empty Task"),
                              content: const Text(
                                  "Task cannot be empty! Please enter a task."),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
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
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  TextField todoTextField() {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
          border: InputBorder.none, // No border
          hintText: "What's on your mind?",
          hintStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFFC6CFDC),
          ) // Placeholder text
          ),
    );
  }

  //when the checkbox is tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todos[index][1] = !todos[index][1];

      // Move to doneTodos if completed
      if (todos[index][1]) {
        doneTodos.add(todos[index]);
        todos.removeAt(index);
      }
    });
  }

  //save new task method
  void saveNewTask() {
    setState(() {
      todos.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
      _selectedIndex = 0; //return to toods
    });
  }

  //delete methode goes here
  void deleteFunction(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  ListView listViewDone() {
    return ListView.builder(
      itemCount: doneTodos.length,
      itemBuilder: (context, index) {
        return ToDoTile(
          taskName: doneTodos[index][0],
          isCompleted: doneTodos[index][1],
          onChanged: (value) => checkBoxChanged(value, index),
          deleteTask: () => deleteFunction(index),
        );
      },
    );
  }
}
