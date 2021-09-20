import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/model/http_exception.dart';
import 'package:pocketmovies/model/user_model.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
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
      final data = response.data as Map<String, dynamic>;
      print(data);
      _user = UserModel.fromJson(data);
      if (_user.code >= 200 && _user.code < 300) {
        _isAuth = true;
        _token = _user.data.accessToken;
      }
      if (_user.status == "unauthorized") throw HttpException('_user.status');
      notifyListeners();
      print(_user.message.success);
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
}
