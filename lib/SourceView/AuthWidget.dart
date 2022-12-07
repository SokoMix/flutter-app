import 'package:flutter/material.dart';
import 'Controller.dart';

Widget _createAccount(context) {
  return TextButton(
      onPressed: () => {Navigator.of(context, rootNavigator: true).pushNamed('/new_acc')},
      style: ButtonStyle(
          alignment: Alignment.center,
          fixedSize: MaterialStateProperty.all(Size(160, 40))),
      child: Text(
        "Создать аккаунт",
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1), fontSize: 15),
      ));
}

class AuthView extends StatefulWidget {
  final Controller controller;

  const AuthView({Key? key, required this.controller}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState(controller: controller);
}

class _AuthViewState extends State<AuthView> {
  final Controller controller;
  final _login = TextEditingController();
  final _pswd = TextEditingController();
  Image? logo = null;

  @override
  void initState() {
    logo = Image.asset("assets/icon/iconBlack.png");
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(logo!.image, context);
  }
  _AuthViewState({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Align(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: 250.0,
                height: 250.0,
                child: logo,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 60.0),
                child: Text(
                  'Rush',
                  style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1), fontSize: 50.0, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontFamily: 'Nexa'),
                )),
          Material(
          color: Colors.black,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: TextField(
                cursorColor: Color.fromRGBO(195, 98, 63, 1),
                style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                controller: _login,
                autocorrect: false,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    size: 20.0,
                    color: Color.fromRGBO(195, 98, 63, 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(195, 98, 63, 1), width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(195, 98, 63, 1), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(195, 98, 63, 1), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(195, 98, 63, 1), width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: 'Логин',
                  hintStyle: TextStyle(color: Color.fromRGBO(215, 121, 88, 1)),
                ),
              ))),
            Material(
                color: Colors.black,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: TextField(
                      cursorColor: Color.fromRGBO(195, 98, 63, 1),
                      style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                      controller: _pswd,
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.key,
                          size: 20.0,
                          color: Color.fromRGBO(195, 98, 63, 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(195, 98, 63, 1), width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(195, 98, 63, 1), width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(195, 98, 63, 1), width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(195, 98, 63, 1), width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Пароль',
                        hintStyle: TextStyle(color: Color.fromRGBO(215, 121, 88, 1)),
                      ),
                    ))),
            Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: OutlinedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(120.0, 40.0)),
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(195, 98, 63, 1)),
                      textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                    ),
                    onPressed: () {
                      if (controller.loginUser(_login.text, _pswd.text)>-1) {Navigator.of(context, rootNavigator: true)
                          .pushNamed('/home_page');}
                      else {
                        showDialog(context: context, builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(child: Text('Ошибка')),
                            backgroundColor: Color.fromRGBO(195, 98, 63, 1),
                            alignment: Alignment.center,
                            content: Text('Неверно введен логин или пароль', textAlign: TextAlign.center,),
                            actions: [
                              TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text('Закрыть', style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),)
                            ],
                          );
                        });
                      }
                    },
                    child: Text(
                      'Войти',
                      style: TextStyle(color: Colors.black),
                    ))),
            _createAccount(context),
          ],
        )));
  }
}
