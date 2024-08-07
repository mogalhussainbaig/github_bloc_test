import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_bloc_task/bloc/item_bloc.dart';
import 'package:github_bloc_task/views/pages/repository_list_page.dart';

import 'data/local/database_helper.dart';
import 'data/remote/github_api_service.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = ItemBloc(GithubApiService(), DatabaseHelper());

    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => itemBloc)],
        child: MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: RepositoryListPage(),
        ));
  }
}
