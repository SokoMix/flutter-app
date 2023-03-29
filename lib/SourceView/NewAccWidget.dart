import 'package:flutter/material.dart';
import '../CustomWidgets/CustomWidgets.dart';
import 'Controller.dart';

Function emailValidator = (str) {
  if (str == null) {
    return 'Логин не может быть пустым';
  }
  if (!RegExp(
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      .hasMatch(str)) {
    return 'Неверно указана почта';
  }
  return null;
};

Function pswdValidator = (str) {
  const String et_alph = 'abcdefghijklmnopqrstuvwxyz';
  const String et_dig = '0123456789';
  if (str == null) {
    return 'Пароль не может быть пустым';
  }
  if (str.length < 6) {
    return 'Пароль должен включать хотя бы 6 символов';
  }
  if (str.toLowerCase() == str) {
    return 'Пароль должен включать заглавную букву';
  }
  if (str.toUpperCase() == str) {
    return 'Пароль должен включать строчную букву';
  }
  int count_alph = 0, count_dig = 0;
  str = str.toLowerCase();
  for (int i = 0; i < str.length; i++) {
    if (et_alph.contains(str[i])) {
      count_alph++;
    }
    if (et_dig.contains(str[i])) {
      count_dig++;
    }
  }
  if (count_dig <= 0) {
    return 'Пароль должен включать хотя бы 1 цифру';
  }
  if (count_alph <= 0) {
    return 'Пароль должен включать хотя бы 1 букву';
  }
  if (count_dig + count_alph != str.length) {
    return 'Пароль должен состоять только из английских букв и цифр';
  }
  return null;
};

Function nameValidator = (str) {
  if ((str ?? '').isEmpty) return 'Имя не может быть пустым';
  const String et =
      'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
  int count = 0;
  str = str!.toLowerCase();
  for (int i = 0; i < str.length; i++) count += et.contains(str[i]) ? 1 : 0;
  if (count != str.length)
    return 'Имя должно включать только русские и английские буквы';
  return null;
};

Function ageValidator = (str) {
  int? val = int.tryParse(str);
  if ((val ?? -1) < 1) return 'Некорректно задан возраст';
  return null;
};

Function surnValidator = (str) {
  if ((str ?? '').isEmpty) return 'Фамилия не может быть пустой';
  const String et =
      'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
  int count = 0;
  str = str!.toLowerCase();
  for (int i = 0; i < str.length; i++) count += et.contains(str[i]) ? 1 : 0;
  if (count != str.length)
    return 'Фамилия должна включать только русские и английские буквы';
  return null;
};

class NewAccWidget extends StatefulWidget {
  final Controller controller;

  const NewAccWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<NewAccWidget> createState() =>
      _NewAccWidgetState(controller: controller);
}

class _NewAccWidgetState extends State<NewAccWidget> {
  final _formKey = GlobalKey<FormState>();
  final _login = TextEditingController();
  final _pswd = TextEditingController();
  final _fname = TextEditingController();
  final _sname = TextEditingController();
  final _age = TextEditingController();
  final customs = CustomWidgets();
  final List<String> _sexList = ['Мужской', 'Женский'];
  String _sexNow = 'Мужской';
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
                customs.regInput(_login, emailValidator,
                    'Введите логин(адрес электронной почты)'),
                customs.regInput(_pswd, pswdValidator, 'Введите пароль'),
                customs.regInput(_fname, nameValidator, 'Введите имя'),
                customs.regInput(_sname, surnValidator, 'Введите фамилию'),
                customs.regInput(_age, ageValidator, 'Введите возраст'),
                Material(
                    color: Colors.black,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Пол:', style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1), fontSize: 17))
                            ),
                            DropdownButton(
                              items: _sexList.map((element) {
                                return DropdownMenuItem(
                                  value: element,
                                  child: Text(element),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setSex(newVal);
                              },
                              value: _sexNow,
                              style: const TextStyle(color: Color.fromRGBO(195, 98, 63, 1), fontSize: 17),
                              dropdownColor: Colors.black54,
                            )
                          ],
                        ))),

                Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(220.0, 50.0)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(195, 98, 63, 1)),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await controller.addUser(_login.text, _pswd.text,
                              _fname.text, _sname.text, _age.text, _sexNow);
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed('/home_page');
                        }
                      },
                      child: const Text(
                        "Создать аккаунт",
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      // }
                    )),
              ],
            )));
  }

  void setSex(data) {
    setState(() {
      _sexNow = data;
    });
  }
}
