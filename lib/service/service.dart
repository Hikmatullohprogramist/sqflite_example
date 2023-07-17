// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_example/data/mind_model.dart';

class LocalDataBases {
  Database? database;
  String tableName = "minds";

  LocalDataBases();

  Future<Database> getDb() async {
    if (database == null) {
      database = await createDataBase();
      return database!;
    }
    return database!;
  }

  createDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = '${dataBasePath}minds.db';

    var database = await openDatabase(path, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $tableName ("
      "mind TEXT,"
      "author TEXT"
      ")",
    );
  }

  Future addMind(MindModel mindModel) async {
    Database db = await getDb();
    var id = await db.insert(tableName, mindModel.toJson());
    print("Mind manashu ID bilan qoshildi $id");
  }

  Future<List> getMinds() async {
    Database db = await getDb();

    var result = await db.query(tableName, columns: ["author", "mind"]);

    return result.toList();
  }

  Future updateMind(MindModel mindModel, String mind) async {
    Database? db = await getDb();

    var id = await db.update(
      tableName,
      mindModel.toJson(),
      where: "mind = ?",
      whereArgs: [mind],
    );

    if (kDebugMode) {
      print("Update boldi");
    }
  }

  Future deleteMind(String mind) async {
    Database? db = await getDb();

    db.delete(tableName, where: "mind = ?", whereArgs: [mind]);
  }
}
