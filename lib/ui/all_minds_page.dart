import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_example/ui/widgets/mind_item.dart';
import 'package:sqflite_example/viewmodel/minds_view_model.dart';

class AllMindsPage extends StatefulWidget {
  const AllMindsPage({super.key});

  @override
  State<AllMindsPage> createState() => _AllMindsPageState();
}

class _AllMindsPageState extends State<AllMindsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All minds page"),
      ),
      body: Consumer<MindsViewModel>(
        builder: (context, value, child) {
          if (value.minds == null) {
            context.read<MindsViewModel>().getMinds();
          }

          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: value.minds!.length,
              itemBuilder: (context, index) {
                return MindItem(mindModel: value.minds![index]);
              },
            );
          }
        },
      ),
    );
  }
}
