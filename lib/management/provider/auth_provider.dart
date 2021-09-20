import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/model/user_model.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;
  UserModel get user => _user;
  var dio = Dio();

  Future<void> signIn(String userName, String password) async {
    try {
      print('sss');
      final response = await dio.post('https://hotflix.club/api/login',
          data: {'username': userName, 'password': password});
      final data = response.data as Map<String, dynamic>;
      print(data);
      _user = UserModel.fromJson(data);
      print(_user.data.user.username);
    } catch (e) {
      print(e.toString());
    }
  }
}
