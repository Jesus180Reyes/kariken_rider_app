import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String name = "";
  String lastName = "";
  String email = "";
  String password = "";

  void addUserDataForm({
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) {
    this.name = name;
    this.lastName = lastName;
    this.email = email;
    this.password = password;
    notifyListeners();
  }
}
