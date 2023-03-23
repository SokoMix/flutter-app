import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Model
{
  final _accounts = FirebaseFirestore.instance.collection("accounts");
  final _plist = FirebaseFirestore.instance.collection("plist");
  List<String>? _users = []; // формат 'id:login:password:FirstName:LastName'
  int _kol = 0;
  Future<void> addUser(String id, String login, String pswd, String fName, String sName) async
  {
    await _createuser(id, login, pswd, fName, sName);
  }

  Future _createuser(String id, String login, String pswd, String fName, String sName) async {
    final user = _accounts.doc(id);
    final json = {
      'id' : id,
      'login' : login,
      'pswd' : pswd,
      'fname' : fName,
      'sname' : sName
    };
    await user.set(json);
}

  Future<int> getLastId() async
  {
    final lastid = await _plist.doc("lastid").get().then((value) => value.data()!["lastid"]);
    _kol = lastid;
    _kol++;
    _plist.doc("lastid").update({"lastid" : _kol});
    return _kol - 1;
  }

  List<String> getUsers() => _users ?? [];

  void deleteUser(String id)
  {
    DocumentReference ref = _accounts.doc(id);
    ref.delete();
  }

  Future<QuerySnapshot> getFireDocs() async
  {
    return await _accounts.get();
  }

  Future<dynamic> loginUser(String login, String pswd) async
  {
    Query que = _accounts.where('login', isEqualTo: login);
    que = que.where('pswd', isEqualTo: pswd);
    return await que.get().then((value) {Map<String, dynamic> mp = value.docs.isNotEmpty ? value.docs.elementAt(0).data() as Map<String, dynamic> : {"id" : "-1"}; return mp["id"] ?? "-1";});
  }
}