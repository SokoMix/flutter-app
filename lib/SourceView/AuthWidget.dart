import 'package:flutter/material.dart';
import '../CustomWidgets/CustomWidgets.dart';
import 'Controller.dart';

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
  final customs = CustomWidgets();
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
            customs.loginInput(_login),
            customs.pswdInput(_pswd),
            customs.loginBtn(context, controller, _login, _login),
            customs.createAccountBtn(context)
          ],
        )));
  }
}
