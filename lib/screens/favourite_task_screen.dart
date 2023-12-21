import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_using_provider/models/todo_model.dart';
import 'package:to_do_using_provider/provider/task_provider.dart';

class FavoriteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Task> favoriteTasks = Provider.of<task_provider>(context)
        .tasks
        .where((task) => task.isFavourite)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Tasks'),
      ),
      body: ListView.builder(
        itemCount: favoriteTasks.length,
        itemBuilder: (context, index) {
          final task = favoriteTasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text('ID: ${task.id}'),
          );
        },
      ),
    );
  }
}
