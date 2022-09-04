// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:cinta_coding/models/response_model.dart';
import 'package:cinta_coding/shared/helper.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../shared/const.dart';
import '../ui/pages/login.dart';

class LoginProvider with ChangeNotifier {
  // NOTE : Data user yang telah login
  User? _dataUser;
  User? get dataUser => _dataUser;
  set dataUser(User? dataUser) {
    _dataUser = dataUser!;
    notifyListeners();
  }

  // NOTE : Data semua user yang ada didb
  List<User> _listUser = [];
  List<User>? get listUser => _listUser;
  set listUser(List<User>? listUser) {
    _listUser = listUser!;
    notifyListeners();
  }

  // NOTE : 0 = onboarding, 1 = login form
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int countDataUser() {
    if (_dataUser != null) {
      if (_dataUser?.id != null) {
        return 1;
      }
    }
    return 0;
  }

  int countUser() {
    return _listUser != null ? _listUser.length : 0;
  }

  String showNameByID(int id) {
    var user = _listUser.where(
      (usr) => usr.id == id,
    );
    if (user.toString() != "()") {
      return user.first.name!;
    }
    return "Unknown";
  }

  Future<bool> checkUser(String name) async {
    var user = _listUser.where(
      (usr) => usr.username?.toLowerCase().trim() == name.toLowerCase().trim(),
    );
    if (user.toString() != "()") {
      return true;
    }
    return false;
  }

  Future<void> saveDataUser(String name) async {
    var user = _listUser.where(
      (u) => u.username?.toLowerCase().trim() == name.toLowerCase().trim(),
    );
    if (user.toString() != "()") {
      dataUser = User.fromJson(user.first.toJson());
    }
  }

  Future<void> logout(context) async {
    currentIndex = 0;

    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const Login();
        },
      ),
      (_) => false,
    );

    dataUser = User();
  }

  Future<void> login(
    context,
    username,
    password,
  ) async {
    if (countUser() == 0 ||
        !await checkUser(username.toString()) ||
        password.toString().trim() == "") {
      String message = "Data user tidak ada";
      if (password.toString().trim() == "" ||
          username.toString().trim() == "") {
        message = "Password atau username tidak boleh kosong!";
      }

      Helper().showSnackBar(
        message,
        context,
      );
      return;
    }
    await saveDataUser(username.toString());
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/home',
      (Route<dynamic> route) => false,
    );
  }

  Future<void> fetchUsers() async {
    Helper().getApi(
      baseUrl,
      apiUser,
      (res) {
        ResponseModel resModel = ResponseModel.fromJson(res);
        if (resModel.rc == 200) {
          List<User>? _listTemp = [];
          if (resModel.data.toString() != "[]") {
            for (var item in resModel.data) {
              _listTemp.add(User.fromJson(item));
            }
            _listUser = _listTemp;
          }
        }
      },
    );
  }
}
