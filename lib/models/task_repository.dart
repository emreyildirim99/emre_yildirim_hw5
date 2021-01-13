import 'package:cet_todo_app/models/task_item.dart';
import 'package:flutter/cupertino.dart';
import 'dart:collection';
import 'package:cet_todo_app/database/DbHelper.dart';

class TaskRepository extends ChangeNotifier {
  DbHelper _dbHelper = DbHelper();
  List<TaskItem> tasks = [];


  TaskRepository() {
    //Get all tasks from DB
    getTasks();
  }

  int taskCount() {
    return tasks.length;
  }

  int incompleteTaskCount() {
    return tasks.where((t) => !t.isDone).length;
  }

  void getTasks() async {
    this.tasks = await _dbHelper.getTasks();
    notifyListeners();
  }

  void addTask(TaskItem task) {
    tasks.add(task);
    _dbHelper.insertTask(task);
    getTasks();
    notifyListeners();
  }

  void toggleTask(TaskItem task) {
    task.isDone = !task.isDone;
    _dbHelper.updateTask(task.id,task);
    getTasks();
    notifyListeners();
  }

  void deleteTask(TaskItem task) {
    tasks.remove(task);
    _dbHelper.removeTask(task.id);
    getTasks();
    notifyListeners();
  }
}
