import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Model
{
  final _accounts = FirebaseFirestore.instance.collection("accounts");
  final _storage = FirebaseStorage.instanceFor(bucket: "gs://rush-ca906.appspot.com");
  final _plist = FirebaseFirestore.instance.collection("plist");
  List<String>? _users = []; // формат 'id:login:password:FirstName:LastName'
  int _kol = 0;
  int _id = -1;

  Future<void> addUser(String id, String login, String pswd, String fName, String sName, String age, String sex) async
  {
    await _createuser(id, login, pswd, fName, sName, age, sex);
  }

  Future _createuser(String id, String login, String pswd, String fName, String sName, String age, String sex) async {
    final user = _accounts.doc(id);
    final json = {
      'id' : id,
      'login' : login,
      'pswd' : pswd,
      'fname' : fName,
      'sname' : sName,
      'age' : age,
      'sex' : sex,
      'avatar' : '',
    };
    await user.set(json);
}

  Future<int> getLastId() async
  {
    final lastid = await _plist.doc("lastid").get().then((value) => value.data()!["lastid"]);
    _kol = lastid;
    _id = lastid;
    _kol++;
    _plist.doc("lastid").update({"lastid" : _kol});
    return _kol - 1;
  }

  List<String> getUsers() => _users ?? [];

  void deleteUser()
  {
    DocumentReference ref = _accounts.doc(_id.toString());
    ref.delete();
  }

  Future<QuerySnapshot> getFireDocs() async
  {
    return await _accounts.get();
  }

  void setId(int id)
  {
    _id = id;
  }

  int getId()
  {
    return _id;
  }

  Future<String> loginUser(String login, String pswd) async
  {
    Query que = _accounts.where('login', isEqualTo: login);
    que = que.where('pswd', isEqualTo: pswd);
    return await que.get().then((value) {Map<String, dynamic> mp = value.docs.isNotEmpty ? value.docs.elementAt(0).data() as Map<String, dynamic> : {"id" : "-1"}; return mp["id"] ?? "-1";});
  }

  Future uploadImg(Uint8List img) async
  {
    final makeDir = _storage.ref().child('avatars').child(_id.toString());
    await makeDir.putData(img);
    _accounts.doc(_id.toString()).update({'avatar' : _id.toString()});
  }

  Future<Uint8List?> getImg(String id) async
  {
    final findDir = _storage.ref('avatars/$id');
    return await findDir.getData();
  }
}