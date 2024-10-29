import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  //controller to access the content of the textfield
  TextEditingController fieldController = TextEditingController();
  // save and cancel method
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.fieldController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //get user input
            TextField(
              controller: fieldController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "add new task",
              ),
            ),
            //save button + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                //cancel button
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
