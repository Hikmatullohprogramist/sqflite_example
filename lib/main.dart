import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_example/data/repository/mind_repository.dart';
import 'package:sqflite_example/service/service.dart';
import 'package:sqflite_example/viewmodel/minds_view_model.dart';

import 'ui/minds_add_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MindsViewModel(
            mindRepository: MindRepository(
              db: LocalDataBases(),
            ),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
