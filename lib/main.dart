import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/save_task.dart';
import 'package:todo_app/pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SaveTask(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        // navigationBarTheme: NavigationBarThemeData(
        //   labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
        //     (states) {
        //       if (states.contains(WidgetState.selected)) {
        //         return const TextStyle(color: Colors.blue);
        //       }
        //       return const TextStyle(color: Colors.grey);
        //     },
        //   ),
        // ),
        // checkboxTheme: CheckboxThemeData(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(5.0), // Change the radius here
        //   ),
        //   side: const BorderSide(
        //     color: Color(0xFFC6CFDC),
        //     width: 2,
        //   ),
        // ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Color(0xFFFFFFFF),
        // ),
        useMaterial3: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xFF007FFF).withOpacity(0.2),
          elevation: 0,
          foregroundColor: const Color(0xFF007FFF),
        ),
      ),
      // routes: {
      //   // '/': (context) => const HomePage(),
      //   'add-new-task': (context) => const AddNewTaskModal(),
      // },
      home: HomePage(),
    );
  }
}
