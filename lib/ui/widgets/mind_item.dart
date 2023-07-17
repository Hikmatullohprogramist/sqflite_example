// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_example/data/mind_model.dart';
import 'package:sqflite_example/viewmodel/minds_view_model.dart';

class MindItem extends StatelessWidget {
  MindModel? mindModel;
  MindItem({
    super.key,
    required this.mindModel,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController mindCtrl = TextEditingController();
    TextEditingController author = TextEditingController();

    mindCtrl.text = mindModel!.mind;
    author.text = mindModel!.author;
    return ListTile(
      title: Text(mindModel!.mind),
      subtitle: Text(mindModel!.author),
      trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: SizedBox(
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: mindCtrl,
                        decoration: const InputDecoration(
                            label: Text("Quote"), border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: author,
                        decoration: const InputDecoration(
                            label: Text("Author"),
                            border: OutlineInputBorder()),
                      )
                    ],
                  ),
                ),
                title: Text("Malumotni o'zgatirish"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Bekor qilish",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<MindsViewModel>().updateMind(
                            MindModel(mind: mindCtrl.text, author: author.text),
                            mindCtrl.text,
                          );
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Saqlash",
                    ),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(Icons.edit)),
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Rostan ham o'chirasizmi ?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Yoq",
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<MindsViewModel>().deleteMind(mindModel!.mind);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Ha ",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
