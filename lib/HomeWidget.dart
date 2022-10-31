import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int _ibar = 0;

    void set_ibar(int item)
    {
      _ibar = item;
    }

    void _ontap(int index)
    {
      set_ibar(index);
    }

    return MaterialApp(
      title: 'Flutter test',
      home: Scaffold(
          backgroundColor: Colors.teal,
          appBar: AppBar(
            title: Text("Название приложения"),
            backgroundColor: Colors.white30,
            actions:
            <Widget>[
              IconButton(onPressed: null, icon: Icon(Icons.heart_broken, color: Colors.red)),
            ],
            leading: IconButton(onPressed: null, icon: Icon(Icons.settings, color: Colors.black,)),
          ),
          floatingActionButton: null,
          body: null,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.heart_broken, color: Colors.red), label: 'Likes'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
            ],
            selectedItemColor: Colors.blue,
            onTap: _ontap,
            currentIndex: _ibar,
          )
      ),
    );
  }
}