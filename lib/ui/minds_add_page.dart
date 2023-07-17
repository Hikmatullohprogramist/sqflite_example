import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_example/data/mind_model.dart';
import 'package:sqflite_example/ui/all_minds_page.dart';
import 'package:sqflite_example/viewmodel/minds_view_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mind = TextEditingController();
    TextEditingController author = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("SQFLITE EXAMPLE"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<MindsViewModel>().getMinds();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllMindsPage(),
                    ));
              },
              icon: const Icon(Icons.read_more))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              "MINDS APP",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                TextField(
                  controller: mind,
                  decoration: const InputDecoration(
                      label: Text("Quote"), border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: author,
                  decoration: const InputDecoration(
                      label: Text("Author"), border: OutlineInputBorder()),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MindsViewModel>().addMind(
                MindModel(
                  mind: mind.text.trim(),
                  author: author.text.trim(),
                ),
              );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
