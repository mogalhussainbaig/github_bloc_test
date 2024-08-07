import 'package:flutter/material.dart';
import 'package:github_bloc_task/ui/pages/repository_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RepositoryListPage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

