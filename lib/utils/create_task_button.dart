import 'package:flutter/material.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: const Color(0xFF007FFF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //icon
          Icon(
            Icons.add,
            color: Color(0xFF007FFF),
          ),
          //text
          Text(
            "Create Task",
            style: TextStyle(
              color: Color(
                0xFF007FFF,
              ),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
