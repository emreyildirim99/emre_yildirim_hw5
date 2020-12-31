import 'package:cet_todo_app/screens/add_task_screen.dart';
import 'package:flutter/material.dart';

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
                  'Cet Todo',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                      color: Colors.white),
                ),
                Text(
                  '3 Tasks (2 Incomplete)',
                  style: TextStyle(
                    fontSize: 18,
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
              child: ListView(children: [
                ListTile(
                  title: Text(
                    'Study CET 301',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  trailing: Checkbox(
                    value: false,
                    activeColor: Colors.lightBlueAccent,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Study MATH 201',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  trailing: Checkbox(
                    value: false,
                    activeColor: Colors.lightBlueAccent,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Study CET 321',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  trailing: Checkbox(
                    value: false,
                    activeColor: Colors.lightBlueAccent,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Study CET 341',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  trailing: Checkbox(
                    value: false,
                    activeColor: Colors.lightBlueAccent,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
              ]),
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
