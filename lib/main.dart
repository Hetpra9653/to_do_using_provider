import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_using_provider/provider/task_provider.dart';
import 'package:to_do_using_provider/screens/HomePage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => task_provider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TodoListScreen());
  }
}
