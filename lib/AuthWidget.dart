import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget _loginInit() {
  return Material(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: TextField(
            autocorrect: false,
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                size: 20.0,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              hintText: 'Enter your login',
            ),
          )));
}

Widget _pswdInit() {
  return Material(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: TextField(
            obscureText: true,
            autocorrect: false,
            decoration: InputDecoration(
              icon: Icon(
                Icons.key,
                size: 20.0,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              hintText: 'Password',
            ),
          )));
}

Widget _okButton(context) {
  return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: OutlinedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(120.0, 40.0)),
            backgroundColor: MaterialStateProperty.all(Colors.cyan),
            textStyle: MaterialStateProperty.all(TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold)),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/home_page');
          },
          child: Text('Login')));
}

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            home: Builder(
                builder: (context) => Container(
                    color: Colors.white,
                    child: Align(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Icon(
                            // своя иконка будет добавлена позже
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 60.0),
                            child: Text(
                              'Название',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            )),
                        _loginInit(),
                        _pswdInit(),
                        _okButton(context),
                      ],
                    )))));
      },
    );
  }
}
