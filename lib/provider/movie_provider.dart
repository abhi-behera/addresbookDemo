import 'dart:convert';

import 'package:dumyapp1/api_endpoints/api_Endpoints.dart';
import 'package:dumyapp1/model/movies_model/movies_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  List<MoviesModel> _movies = [];

  MovieProvider() {
    moviesApiCall();
  }

  List<MoviesModel> get movies => List.unmodifiable(_movies);

  Future<void> moviesApiCall() async {
    try {
      final response = await http.get(Uri.parse(Api.moviesLsitApi));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        _movies = data.map((movie) => MoviesModel.fromJson(movie)).toList();

        notifyListeners();
      } else {
        throw Exception('Failed to load movies... \nSome error occured...');
      }
    } catch (e) {
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }

      throw e.toString();
    }
  }
}
