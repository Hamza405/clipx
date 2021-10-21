import 'package:flutter/material.dart';
import 'package:pocketmovies/model/category_model.dart';

class HomeProvider with ChangeNotifier {
  List<Category> _category = [];
  List<Category> get category => [..._category];

  String _token = '';
  String get token => _token;

  void getAuth(String? token) => _token = token!;
}
