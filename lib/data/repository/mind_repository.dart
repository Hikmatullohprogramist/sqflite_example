import 'package:sqflite_example/data/mind_model.dart';
import 'package:sqflite_example/service/service.dart';

class MindRepository {
  LocalDataBases? db;

  MindRepository({required this.db});

  void addMind(MindModel mindModel) async => await db!.addMind(mindModel);
  Future<List<MindModel>> getMind() async {
    var result = await db!.getMinds();

    return result.map((e) => MindModel.fromJson(e)).toList();
  }

  void updateMind(MindModel mindModel, String mind) async =>
      await db!.updateMind(mindModel, mind);

  void deleteMind(String mind) async => await db!.deleteMind(mind);
}
