import 'package:flutter/material.dart';
import 'package:todoapp/utilis/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['Learn Flutter', false],
    ['Drink coffee', false],
    ['Go to the gym', false],
    ['Take a shower', false],
    ['Buy groceries', false],
   ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void reorderTasks(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final task = toDoList.removeAt(oldIndex);
      toDoList.insert(newIndex, task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('Simple Todo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ReorderableListView(
        onReorder: reorderTasks,
        padding: const EdgeInsets.all(8.0),
        children: [
          for (int index = 0; index < toDoList.length; index++)
            ListTile(
              key: ValueKey(index),
              title: ToDoList(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(index),
              ),
            ),
        ],
      ),
    );
  }
}
