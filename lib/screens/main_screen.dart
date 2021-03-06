import 'package:cet_todo_app/models/task_repository.dart';
import 'package:cet_todo_app/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cet Todo \nEmre YILDIRIM',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                      color: Colors.white),
                ),
                Text(
                  '${Provider.of<TaskRepository>(context).taskCount()} Tasks (${Provider.of<TaskRepository>(context).incompleteTaskCount()} Incomplete)',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          print('floating action button pressed');
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
      ),
    );
  }
}