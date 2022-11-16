import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _iBar = 0;

  int _getIbar() {
    return this._iBar;
  }

  void _setIbar(int item) {
    this._iBar = item;
  }

  void _onTap(int index) {
    this.setState(() {
      _setIbar(index);
    });
  }

  Widget _settingsMenu() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
              onPressed: null,
              child: Text(
                'Настройки',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Выйти из аккаунта',
                style: TextStyle(fontSize: 20, color: Colors.red),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
              onPressed: null,
              child: Text(
                'Оставить отзыв',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ),
      ],
    ));
  }

  Widget? currentBody() {
    if (this._getIbar() == 0) {
      return null;
    } else if (this._getIbar() == 1) {
      return null;
    } else if (this._getIbar() == 2) {
      return _settingsMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(139, 105, 105, 1),
        appBar: AppBar(
          title: Text("Название приложения"),
          backgroundColor: Color.fromRGBO(205, 155, 155, 1),
          // actions: <Widget>[
          //   IconButton(
          //       onPressed: null,
          //       icon: Icon(Icons.heart_broken, color: Colors.red)),
          // ],
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list_alt,
                size: 25,
              )),
        ),
        body: currentBody(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken), label: 'Likes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
          backgroundColor: Color.fromRGBO(205, 155, 155, 1),
          onTap: _onTap,
          currentIndex: _iBar,
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          unselectedIconTheme: IconThemeData(size: 25),
          selectedIconTheme: IconThemeData(size: 25),
          fixedColor: Colors.blue,
        ));
  }
}
