import 'dart:typed_data';

import 'Model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Controller
{
  late Model model = Model();
  Controller()
  {
    model = Model();
  }

  Future<void> addUser(String login, String pswd, String fName, String sName, String age, String sex) async
  {
    final lastid = await model.getLastId();
    await model.addUser(lastid.toString(), login, pswd, fName, sName, age, sex);
  }

  Future<QuerySnapshot> getAllUsers() async
  {
    return await model.getFireDocs();
  }

  void deleteUser(String id)
  {
    model.deleteUser();
  }

  Future setImage() async
  {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imgBytes = await img!.readAsBytes();
    await model.uploadImg(imgBytes);
  }

  Future<Image> getAvatar(String id, context) async
  {
    final lst = await model.getImg(id) ?? Uint8List(0);
    return Image.memory(lst, width: MediaQuery.of(context).size.width, height: 300,);
  }

  Future<int> loginUser(String login, String pswd) async
  {
    model.setId(int.parse(await model.loginUser(login, pswd)));
    return model.getId();
  }

  String currentUserId()
  {
    return model.getId().toString();
  }
}