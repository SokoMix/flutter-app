import 'package:flutter/material.dart';
import 'Controller.dart';

class NewAccWidget extends StatefulWidget {
  final Controller controller;

  const NewAccWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<NewAccWidget> createState() => _NewAccWidgetState(controller: controller);
}

String? checkEmail(int validate)
{
  if (validate == 1) {return 'Username Can\'t Be Empty';}
  if (validate == 2) {return 'Incorrect email';}
  return null;
}

class _NewAccWidgetState extends State<NewAccWidget> {
  final _formKey = GlobalKey<FormState>();
  final _login = TextEditingController();
  final _pswd = TextEditingController();
  final _fname = TextEditingController();
  final _sname = TextEditingController();
  final Controller controller;
  _NewAccWidgetState({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Material(color: Colors.black,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: TextFormField(
                  controller: _login,
                  autocorrect: false,
                  cursorColor: Color.fromRGBO(195, 98, 63, 1),
                  style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                  validator: (str)
                  {
                    if (str == null) {return 'Логин не может быть пустым';}
                    if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(str)) {return 'Неверно указана почта';}
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintStyle: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                    hintText: 'Введите логин(адрес электронной почты)',
                    // errorText: checkEmail(_validate),
                  ),
                )
            )),
    Material(color: Colors.black,
        child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: TextFormField(
                  controller: _pswd,
                  autocorrect: false,
                  cursorColor: Color.fromRGBO(195, 98, 63, 1),
                  style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                  validator: (str)
                  {
                    const String et_alph = 'abcdefghijklmnopqrstuvwxyz';
                    const String et_dig = '0123456789';
                    if (str == null) {return 'Пароль не может быть пустым';}
                    if (str.length < 6) {return 'Пароль должен включать хотя бы 6 символов';}
                    if (str.toLowerCase() == str) {return 'Пароль должен включать заглавную букву';}
                    if (str.toUpperCase() == str) {return 'Пароль должен включать строчную букву';}
                    int count_alph = 0, count_dig = 0;
                    str = str.toLowerCase();
                    for (int i = 0; i < str.length; i++) {
                      if (et_alph.contains(str[i])) {count_alph++;}
                      if (et_dig.contains(str[i])) {count_dig++;}
                    }
                    if (count_dig <= 0) {return 'Пароль должен включать хотя бы 1 цифру';}
                    if (count_alph <= 0) {return 'Пароль должен включать хотя бы 1 букву';}
                    if (count_dig+count_alph != str.length) {return 'Пароль должен состоять только из английских букв и цифр';}
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintStyle: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                    hintText: 'Введите пароль',
                  ),
                ))),
            Material(color:Colors.black,
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: TextFormField(
                  controller: _fname,
                  autocorrect: false,
                  cursorColor: Color.fromRGBO(195, 98, 63, 1),
                  style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                  decoration: InputDecoration(
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
                    hintStyle: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                    hintText: 'Введите имя',
                  ),
                  validator: (str) {
                    if ((str ?? '').isEmpty) return 'Имя не может быть пустым';
                    const String et = 'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
                    int count = 0;
                    str = str!.toLowerCase();
                    for (int i = 0; i < str.length; i++) count += et.contains(str[i]) ? 1 : 0;
                    if (count != str.length) return 'Имя должно включать только русские и английские буквы';
                    return null;
                  },
                ))),
    Material(color:Colors.black,
        child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: TextFormField(
                  controller: _sname,
                  autocorrect: false,
                  cursorColor: Color.fromRGBO(195, 98, 63, 1),
                  style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                  decoration: InputDecoration(
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
                    hintStyle: TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                    hintText: 'Введите фамилию',
                  ),
                  validator: (str) {
                  if ((str ?? '').isEmpty) return 'Фамилия не может быть пустой';
                  const String et = 'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
                  int count = 0;
                  str = str!.toLowerCase();
                  for (int i = 0; i < str.length; i++) count += et.contains(str[i]) ? 1 : 0;
                  if (count != str.length) return 'Фамилия должна включать только русские и английские буквы';
                  return null;
                  },
                ))),
    Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: OutlinedButton(
                    child: Text("Создать аккаунт", style: TextStyle(fontSize: 21, color: Colors.black, fontWeight: FontWeight.bold),),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(220.0, 50.0)),
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(195, 98, 63, 1)),
                    ),
                    onPressed:
                      () {
                      if (_formKey.currentState!.validate()) {
                        controller.addUser(_login.text, _pswd.text, _fname.text, _sname.text);
                      Navigator.of(context, rootNavigator: true).pushNamed('/home_page');
                      }
                      },
                    // }
                )
    ),
          ],
        )));
  }
}
