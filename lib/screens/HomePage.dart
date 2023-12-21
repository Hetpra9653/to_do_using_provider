import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_using_provider/models/todo_model.dart';
import 'package:to_do_using_provider/provider/task_provider.dart';
import 'package:to_do_using_provider/screens/favourite_task_screen.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteTasksScreen(),
                  ),
                );
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: Consumer<task_provider>(
        builder: (context, taskProvider, child) {
          final tasks = taskProvider.tasks;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.title),
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    Provider.of<task_provider>(context, listen: false)
                        .toggleTaskCompletion(task.id);
                  },
                ),
                trailing: IconButton(
                  onPressed: () {
                    Provider.of<task_provider>(context, listen: false)
                        .favouriteTask(task.id);
                  },
                  icon: Icon(
                    task.isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: task.isFavourite ? Colors.red : null,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    TextEditingController _taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(labelText: 'Task Title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final taskTitle = _taskController.text;
                if (taskTitle.isNotEmpty) {
                  final task = Task(
                    id: DateTime.now().toString(),
                    title: taskTitle,
                    isCompleted: false,
                  );
                  Provider.of<task_provider>(context, listen: false)
                      .addTask(task);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
