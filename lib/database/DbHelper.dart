import 'dart:async';
import 'package:path/path.dart';
import 'package:cet_todo_app/models/task_item.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "ToDoList.db");

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    return await db.execute("CREATE TABLE ToDoList(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER)");
  }

  Future<List<TaskItem>> getTasks() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM ToDoList ORDER BY id DESC");
    return result.map((data) => TaskItem.fromMap(data)).toList();
  }

  Future<int> insertTask(TaskItem taskItem) async{
    var dbClient = await db;
    return await dbClient.insert("ToDoList", taskItem.toMap());
  }

  Future<int> updateTask(int id,TaskItem taskItem) async{
    var dbClient = await db;
    return await dbClient.update("ToDoList", taskItem.toMap(),where: "id = ?", whereArgs: [id]);
  }

  Future<void> removeTask(int id) async{
    var dbClient = await db;
    return await dbClient.delete("ToDoList", where: "id = ?", whereArgs: [id]);
  }

}