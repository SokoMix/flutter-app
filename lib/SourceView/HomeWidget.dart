import 'package:cloud_firestore/cloud_firestore.dart';
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
    return _iBar;
  }

  void _setIbar(int item) {
    _iBar = item;
  }

  void _onTap(int index) {
    setState(() {
      _setIbar(index);
    });
  }

  Widget _settingsMenu() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
              onPressed: null,
              child: Text(
                'Настройки',
                style: TextStyle(
                    fontSize: 17, color: Color.fromRGBO(195, 98, 63, 1)),
              )),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
              onPressed: null,
              child: Text(
                'Оставить отзыв',
                style: TextStyle(
                    fontSize: 17, color: Color.fromRGBO(195, 98, 63, 1)),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
              onPressed: () {
                widget.controller.setImage();
              },
              child: const Text(
                'Добавить фото',
                style: TextStyle(
                    fontSize: 17, color: Color.fromRGBO(195, 98, 63, 1)),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text(
                'Выйти из аккаунта',
                style: TextStyle(fontSize: 17, color: Colors.red),
              )),
        ),
      ],
    ));
  }

  Widget makeCard(
      String name, String surname, String age, String sex, String id, Controller controller) {
    if (sex == 'Мужской') {
      sex = 'мужчина';
    } else {
      sex = 'женщина';
    }
    return Card(
        elevation: 2.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.teal,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          side: BorderSide(
            width: 1.0,
            color: Colors.cyan,
          )
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(radius: 0.9, colors: [Colors.teal, Colors.black], center: Alignment.bottomCenter),
            // image: DecorationImage(
            //   image: AssetImage('assets/backroundCard.png'),
            //   fit: BoxFit.cover,
            //   alignment: Alignment.topCenter
            // )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: controller.getAvatar(id, context),
                  builder: (context, session) {
                    if (session.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                          color: Color.fromRGBO(195, 98, 63, 1));
                    } else if (session.connectionState == ConnectionState.done &&
                        session.hasData) {
                      return session.data!;
                    } else if (session.connectionState == ConnectionState.done &&
                        !session.hasData) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width / 2),
                        child: const Text(
                          "Нет фото",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      );
                    }
                    return const Text("Error");
                  }),
              ListTile(
                title: Text(
                  '$name $surname',
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
                subtitle: Text(
                  'Возраст: $age, $sex',
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.favorite,
                  color: Colors.cyan,
                  size: 25,
                ),
              ),
            ],
          )
        )
    );
  }

  Widget usersCards(Controller contr) {
    final alldocs = contr.getAllUsers();
    return FutureBuilder<QuerySnapshot>(
        future: alldocs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                  color: Color.fromRGBO(195, 98, 63, 1)),
            );
          } else if (snapshot.hasError) {
            return const Text("Ошибка");
          } else {
            List<Widget> cards = [];
            final curId = widget.controller.currentUserId();
            snapshot.data?.docs.forEach((element) {
              Map<String, dynamic> data =
                  element.data() as Map<String, dynamic>;
              if (data['id'] != curId) {
                cards.add(makeCard(data['fname'] ?? '', data['sname'] ?? '',
                    data['age'] ?? '', data['sex'] ?? '', data['id'] ?? '-1', widget.controller));
              }
            });
            return Column(
              children: cards,
            );
          }
        });
  }

  Widget? currentBody(Controller contr) {
    if (_getIbar() == 0) {
      return usersCards(contr);
    } else if (_getIbar() == 1) {
      return null;
    } else if (_getIbar() == 2) {
      return _settingsMenu();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Rush',
            style: TextStyle(
                color: Color.fromRGBO(195, 98, 63, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'Nexa'),
          ),
          shape:
              const Border(bottom: BorderSide(width: 2.0, color: Colors.cyan)),
          backgroundColor: Colors.black,
          // actions: <Widget>[
          //   IconButton(
          //       onPressed: null,
          //       icon: Icon(Icons.heart_broken, color: Colors.red)),
          // ],
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list_alt,
                color: Color.fromRGBO(195, 98, 63, 1),
                size: 25,
              )),
        ),
        body: SingleChildScrollView(child: currentBody(widget.controller)),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.cyan,
              border: Border(top: BorderSide(width: 2.0, color: Colors.cyan))),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(195, 98, 63, 1),
                ),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
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
            selectedLabelStyle: const TextStyle(
                fontSize: 12, color: Color.fromRGBO(195, 98, 63, 1)),
            unselectedLabelStyle: const TextStyle(
                fontSize: 12, color: Color.fromRGBO(195, 98, 63, 1)),
            unselectedIconTheme: const IconThemeData(
                size: 25, color: Color.fromRGBO(195, 98, 63, 1)),
            selectedIconTheme:
                const IconThemeData(size: 25, color: Colors.cyan),
            unselectedItemColor: const Color.fromRGBO(195, 98, 63, 1),
            selectedItemColor: Colors.cyan,
          ),
        ));
  }
}
