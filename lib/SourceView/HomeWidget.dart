import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Controller.dart';

class HomePage extends StatefulWidget {
  final Controller controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(controller);
}

class _HomePageState extends State<HomePage> {
  int _iBar = 0;
  final controller;

  int _getIbar() {
    return this._iBar;
  }

  _HomePageState(this.controller);

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

  Widget makeCard(String name, String desc, String gym)
  {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(name,
        style: TextStyle(fontSize: 17, color: Colors.red),
      ),
        subtitle: Text(desc, style: TextStyle(fontSize: 17, color: Colors.red),),
        trailing: Text(gym, style: TextStyle(fontSize: 17, color: Colors.red),),
      )
    );
    }

  Widget usersCards(Controller contr)
  {
    
    final alldocs = contr.getAllUsers();
    return FutureBuilder<QuerySnapshot>(
      future: alldocs,
      builder: (context, snapshot)
      {
            if (snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(
                  child: CircularProgressIndicator(
                      color: Color.fromRGBO(195, 98, 63, 1)
                  ),
                );
              }
            else if (snapshot.hasError)
              {
                return Text("Ошибка");
              }
            else
              {
                List<Widget> cards = [];
                cards = (snapshot.data?.docs.map((val) {
                  Map<String, dynamic> data = val.data() as Map<String, dynamic>;
                  return makeCard(data['fname'] ?? '', data['sname'] ?? '', data['login'] ?? '');
                }))!.toList();
                cards.removeAt(cards.length - 1);
                return Column(
                  children: cards,
                );
              }
        }
    );
    
    
    
    // final ss = contr.getAllUsers();
    // return StreamBuilder(
    //   stream: ss,
    //   builder: (context, stream)
    //   {
    //     if (stream.connectionState == ConnectionState.waiting || stream.connectionState == ConnectionState.done)
    //       {
    //         print(1);
    //         return CircularProgressIndicator();
    //       }
    //     else if (stream.connectionState == ConnectionState.active && stream.hasData)
    //       {
    //         print(2);
    //         List<Widget> cards = [];
    //         stream.data?.docs.map((doc) {
    //           cards.add(makeCard(doc['fname'], doc['sname'], doc['login']));
    //           print(doc['fname']);
    //           print(doc['sname']);
    //           print(doc['login']);
    //         });
    //         return Column(
    //           children: cards,
    //         );
    //       }
    //     else
    //       {
    //         print(3);
    //         return Text("Ошибка");
    //       }
    //   }
    // );
  }

  Widget? currentBody(Controller contr)
  {
    if (this._getIbar() == 0) {
      return usersCards(contr);
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
        body: currentBody(controller),
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
