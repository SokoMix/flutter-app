import 'Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Controller
{
  late Model model = Model();
  Controller()
  {
    model = Model();
  }

  Future<void> addUser(String login, String pswd, String fName, String sName) async
  {
    final lastid = await model.getLastId();
    await model.addUser(lastid.toString(), login, pswd, fName, sName);
  }

  Future<QuerySnapshot> getAllUsers() async
  {
    return await model.getFireDocs();
  }

  void deleteUser(String id)
  {
    model.deleteUser(id);
  }

  Future<int> loginUser(String login, String pswd) async
  {
    return int.parse(await model.loginUser(login, pswd));
  }
}