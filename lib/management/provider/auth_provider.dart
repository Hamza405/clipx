import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/model/http_exception.dart';
import 'package:pocketmovies/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final String keyUserData = 'userData';
  var dio = Dio();
  UserModel _user;
  UserModel get user => _user;
  String _token;
  String get token => _token;
  bool _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> signIn(String userName, String password) async {
    try {
      print('sss');
      final response = await dio.post('https://hotflix.club/api/login',
          data: {'username': userName, 'password': password});
      final data = response.data;
      print(data);
      _user = UserModel.fromJson(data);
      if (_user.code >= 200 && _user.code < 300) {
        _isAuth = true;
        _token = _user.data.accessToken.toString();
        print('Token : $_token');
      }
      notifyListeners();
      print(_user.message.success);
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  Future<void> SignUp(String firstName, String lastname, String email,
      String password, String userName, String phoneNumber) async {
    print('signip');
    try {
      final response =
          await dio.post('https://hotflix.club/api/register', data: {
        'firstname': firstName,
        'lastname': lastname,
        'email': email,
        'password': password,
        'password_confirmation': password,
        'username': userName,
        'mobile': phoneNumber,
        'agree': 1
      });
      final data = response.data as Map<String, dynamic>;
      print(data);
      _user = UserModel.fromJson(data);
      if (_user.code >= 200 && _user.code < 300) {
        _isAuth = true;
        _token = _user.data.accessToken.toString();
        print('Token : $_token');
      }
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userName': userName,
      });
      prefs.setString(keyUserData, userData);
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  Future<void> logout() {
    _token = null;
    _user = null;
    _isAuth = false;
    notifyListeners();
  }
}
