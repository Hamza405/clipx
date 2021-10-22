import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/model/category_model.dart';
import 'package:pocketmovies/model/movie_model.dart';

class HomeProvider with ChangeNotifier {
  static const baseUrl = 'https://hotflix.club/api/';
  var dio = Dio();

  List<Category> _category = [];
  List<Category> get category => [..._category];

  List<Movies> _movies = [];
  List<Movies> get movies => _movies;

  List<Movies> _topMovies = [];
  List<Movies> get topMovies => _topMovies;

  String _token = '';
  String get token => _token;

  void getAuth(String? token) => _token = token!;

  Future<void> fetchAllData() async {
    await fetchCategorys();
    await fetchMovies();
    await fetchCategorys();
  }

  Future<void> fetchCategorys() async {
    try {
      final response = await dio.get(baseUrl + 'homepage/allCategories');
      CategoryModel res = CategoryModel.fromJson(response.data);
      _category = res.message!.category!;
      notifyListeners();
      fetchTopMovie();
    } catch (e) {
      throw e;
    }
  }

  Future<void> fetchMovies() async {
    try {
      final respone = await dio.post(baseUrl + 'user/movies/show/all',
          options: Options(headers: {"Authorization": "Bearer $_token"}));
      MovieModel movieModel = MovieModel.fromJson(respone.data);
      _movies = movieModel.data!.movies!;
      print(_movies.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchTopMovie() async {
    List<Movies> m = [];
    try {
      final response = await dio.post('https://hotflix.club/api/user/homepage',
          data: {'sectionname': 'top'},
          options: Options(headers: {"Authorization": "Bearer $_token"}));
      print('topMovie: ${response.data['message'][1]['topRateds']}');
      List<dynamic> v = response.data['message'][1]['topRateds'];
      v.forEach((e) {
        m.add(Movies.fromJson(e));
      });
      _topMovies = m;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
