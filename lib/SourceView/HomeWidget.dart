import 'package:flutter/material.dart';
import 'Controller.dart';

class HomePage extends StatefulWidget {
  final Controller controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                style: TextStyle(fontSize: 17, color: Color.fromRGBO(195, 98, 63, 1)),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
              onPressed: null,
              child: Text(
                'Оставить отзыв',
                style: TextStyle(fontSize: 17, color: Color.fromRGBO(195, 98, 63, 1)),
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
                style: TextStyle(fontSize: 17, color: Colors.red),
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Rush',
            style:
                TextStyle(color: Color.fromRGBO(195, 98, 63, 1), fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontFamily: 'Nexa'),
          ),
          shape: Border(bottom: BorderSide(width: 2.0, color: Colors.cyan)),
          backgroundColor: Colors.black,
          // actions: <Widget>[
          //   IconButton(
          //       onPressed: null,
          //       icon: Icon(Icons.heart_broken, color: Colors.red)),
          // ],
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list_alt,
                color: Color.fromRGBO(195, 98, 63, 1),
                size: 25,
              )),
        ),
        body: currentBody(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.cyan,
              border: Border(top: BorderSide(width: 2.0, color: Colors.cyan))),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(195, 98, 63, 1),
                ),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.heart_broken,
                    color: Color.fromRGBO(195, 98, 63, 1),
                  ),
                  label: 'Лайки'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Color.fromRGBO(195, 98, 63, 1),
                  ),
                  label: 'Настройки')
            ],
            backgroundColor: Colors.black,
            onTap: _onTap,
            currentIndex: _iBar,
            selectedLabelStyle:
                TextStyle(fontSize: 12, color: Color.fromRGBO(195, 98, 63, 1)),
            unselectedLabelStyle:
                TextStyle(fontSize: 12, color: Color.fromRGBO(195, 98, 63, 1)),
            unselectedIconTheme:
                IconThemeData(size: 25, color: Color.fromRGBO(195, 98, 63, 1)),
            selectedIconTheme: IconThemeData(size: 25, color: Colors.cyan),
            unselectedItemColor: Color.fromRGBO(195, 98, 63, 1),
            selectedItemColor: Colors.cyan,
          ),
        ));
  }
}
// BoxDecoration(color: Colors.cyan, border: null, child :)
