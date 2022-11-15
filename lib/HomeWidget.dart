import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int _ibar = 0;

    void _set_ibar(int item) {
      _ibar = item;
    }

    void _ontap(int index) {
      _set_ibar(index);
    }

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Flutter test',
          home: Scaffold(
              backgroundColor: Color.fromRGBO(139, 105, 105, 1),
              appBar: AppBar(
                title: Text("Название приложения"),
                backgroundColor: Color.fromRGBO(205, 155, 155, 1),
                actions: <Widget>[
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.heart_broken, color: Colors.red)),
                ],
                leading: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,
                    )),
              ),
              floatingActionButton: null,
              body: null,
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.heart_broken, color: Colors.red),
                      label: 'Likes'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings')
                ],
                selectedItemColor: Colors.blue,
                backgroundColor: Color.fromRGBO(205, 155, 155, 1),
                onTap: _ontap,
                currentIndex: _ibar,
              )),
        );
      },
    );
  }
}
