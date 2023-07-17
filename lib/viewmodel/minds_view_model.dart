import 'package:flutter/material.dart';
import 'package:sqflite_example/data/mind_model.dart';
import 'package:sqflite_example/data/repository/mind_repository.dart';

class MindsViewModel extends ChangeNotifier {
  MindRepository? mindRepository;

  List<MindModel>? minds;

  bool isLoading = false;

  MindsViewModel({required this.mindRepository});

  void addMind(MindModel mindModel) async {
    mindRepository!.addMind(mindModel);
  }

  void getMinds() async {
    loadingChanger();
    minds = await mindRepository!.getMind();
    loadingChanger();
  }

  void updateMind(MindModel mindModel, String mind) async {
    mindRepository!.updateMind(mindModel, mind);
    getMinds();
  }

  void deleteMind(String mind) async {
    mindRepository!.deleteMind(mind);
    getMinds();
  }

  void loadingChanger() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
