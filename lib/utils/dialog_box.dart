import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        'New Task',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Add a new task",
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                  buttonColor: Colors.grey[300] ?? Colors.grey,
                  textColor: Colors.black,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MyButton(
                  text: "Save",
                  onPressed: onSave,
                  buttonColor: Colors.blue[300] ?? Colors.blue,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Update MyButton to accept colors
class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
