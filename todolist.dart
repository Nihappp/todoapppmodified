import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key, required this.taskName, required this.taskCompleted, required this.onChanged});

  final String taskName;
  final bool taskCompleted;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              taskName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.white,
              checkColor: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}
