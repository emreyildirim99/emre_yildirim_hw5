import 'package:scidart/numdart.dart';

class TaskItem {
  int id;
  String title;
  bool isDone;
  TaskItem({this.title, this.isDone});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = title;
    map["isDone"] = boolToInt(isDone);
    return map;
  }

  TaskItem.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    isDone = intToBool(map["isDone"]);
  }

}
