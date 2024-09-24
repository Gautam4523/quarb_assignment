// lib/controllers/movie_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/movie_model.dart';

class MovieController extends GetxController {
  Future<void> fetchMovie({String searchText = ''}) async {
    setIsLoading(true);
    var apiUrl = searchText.isNotEmpty
        ? 'https://api.tvmaze.com/search/shows?q=$searchText'
        : 'https://api.tvmaze.com/search/shows?q=all';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setMovie(
          MovieModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes))));
      setIsLoading(false);
    }
  }

  final RxList<MovieModel> _movie = RxList([]);
  List<MovieModel> get movie => _movie.value;
  setMovie(List<MovieModel> value) {
    _movie.value = value;
  }

  final RxBool _isLoading = RxBool(true);
  bool get isLoading => _isLoading.value;
  setIsLoading(bool value) {
    _isLoading.value = value;
  }

  final RxBool _isSearching = RxBool(false);
  bool get isSearching => _isSearching.value;
  setSearching(bool value) {
    _isSearching.value = value;
  }
}
