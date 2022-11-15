import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  Home createState() => Home();
}

class Home extends State<App> {
  List task = [];
  String input = "";

  void initState() {
    super.initState();
    task.add("Sleep");
    task.add("Talk");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[600],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Task Activity"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          task.add(input);
                        });
                      },
                      child: Text("Add"),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: ObjectKey(task[index]),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  task.removeAt(index);
                });
              },
              child: Card(
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Text(task[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[400],
                    ),
                    onPressed: () {
                      setState(() {
                        task.removeAt(index);
                      });
                    },
                  ),
                ),
              ));
        },
      ),
    );
  }
}
