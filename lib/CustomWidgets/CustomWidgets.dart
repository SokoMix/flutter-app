import 'package:flutter/material.dart';

class CustomWidgets {
  Widget loginInput(login) {
    return Material(
        color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: TextField(
              cursorColor: const Color.fromRGBO(195, 98, 63, 1),
              style: const TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
              controller: login,
              autocorrect: false,
              decoration: const InputDecoration(
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(195, 98, 63, 1), width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'Логин',
                hintStyle: TextStyle(color: Color.fromRGBO(215, 121, 88, 1)),
              ),
            )));
  }

  Widget pswdInput(pswd) {
    return Material(
        color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: TextField(
              cursorColor: const Color.fromRGBO(195, 98, 63, 1),
              style: const TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
              controller: pswd,
              obscureText: true,
              autocorrect: false,
              decoration: const InputDecoration(
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(195, 98, 63, 1), width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'Пароль',
                hintStyle: TextStyle(color: Color.fromRGBO(215, 121, 88, 1)),
              ),
            )));
  }

  Widget createAccountBtn(context) {
    return TextButton(
        onPressed: () =>
            {Navigator.of(context, rootNavigator: true).pushNamed('/new_acc')},
        style: ButtonStyle(
            alignment: Alignment.center,
            fixedSize: MaterialStateProperty.all(const Size(160, 40))),
        child: const Text(
          "Создать аккаунт",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromRGBO(195, 98, 63, 1), fontSize: 15),
        ));
  }

  Widget loginBtn(context, controller, login, pswd, isLoading) {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
        child: OutlinedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(120.0, 40.0)),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(195, 98, 63, 1)),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            ),
            onPressed: () async {
              isLoading(true);
              if (await controller.loginUser(login.text, pswd.text) > -1) {
                isLoading(false);
                Navigator.of(context, rootNavigator: true)
                    .pushNamed('/home_page');
              } else {
                isLoading(false);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Center(child: Text('Ошибка')),
                        backgroundColor: const Color.fromRGBO(195, 98, 63, 1),
                        alignment: Alignment.center,
                        content: const Text(
                          'Неверно введен логин или пароль',
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            child: const Text(
                              'Закрыть',
                              style: TextStyle(
                                  color: Color.fromRGBO(195, 98, 63, 1)),
                            ),
                          )
                        ],
                      );
                    });
              }
            },
            child: const Text(
              'Войти',
              style: TextStyle(color: Colors.black),
            )));
  }

  Widget regInput(TextEditingController controller, func, String title) {
    return Material(
        color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: TextFormField(
              controller: controller,
              autocorrect: false,
              cursorColor: const Color.fromRGBO(195, 98, 63, 1),
              style: const TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
              validator: func,
              decoration: InputDecoration(
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(195, 98, 63, 1), width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(195, 98, 63, 1), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(195, 98, 63, 1), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(195, 98, 63, 1), width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintStyle:
                    const TextStyle(color: Color.fromRGBO(195, 98, 63, 1)),
                hintText: title,
                // errorText: checkEmail(_validate),
              ),
            )));
  }

  Widget userCard() {
    return Card(
      elevation: 5.0,
      child: Column(
        children: const [
          ListTile(
            title: Text("Дима Соколов"),
            subtitle: Text("Мужчина, 18 лет, г. Климовск"),
            trailing: Icon(Icons.favorite, color: Colors.red),
          ),
          Text("Адрес зала: ул. Ленина, д.5"),
          //фото профиля
        ],
      ),
    );
  }
}
