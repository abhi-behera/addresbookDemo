import 'dart:convert';
import 'dart:isolate';

import 'package:dumyapp1/api_endpoints/api_Endpoints.dart';
import 'package:dumyapp1/model/movies_model/movies_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  List<MoviesModel> _movies = [];

  MovieProvider() {
    // moviesApiCall();
    callIsolates();
  }

  List<MoviesModel> get movies => List.unmodifiable(_movies);

//  with isolates
  Future<void> callIsolates() async {
    debugPrint("Isolates called");

    final receivePort = ReceivePort();

    try {
      debugPrint("Isolates try block");

      ////////////////// Isolates aproach 1 //////////////////
      await Isolate.spawn(loadApiData, receivePort.sendPort);
      receivePort.listen((message) {
        debugPrint("message: $message");
        final List<MoviesModel> moviesList = message;
        _movies = moviesList;
        debugPrint("movies: $_movies");
      });

      ////////////////// Isolates aproach 2 using compute() //////////////////
      // final List<MoviesModel> moviesList =
      //     await compute(fetchAndParseMovies, Api.moviesLsitApi);
      /*same as recive and send port one, param - function and any data that is needed for the function....*/
      // _movies = moviesList;

      notifyListeners();
    } catch (e) {
      String errorMessage = "Error starting isolate: $e";
      debugPrint(errorMessage);
      notifyListeners();
    }
  }

  // Future<List<MoviesModel>> fetchAndParseMovies(String apiUrl) async {
  //   final response = await http.get(Uri.parse(apiUrl));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     return data.map((movie) => MoviesModel.fromJson(movie)).toList();
  //   } else {
  //     throw Exception('Failed to load movies... \nSome error occurred...');
  //   }
  // }

  static Future<void> loadApiData(SendPort sendPort) async {
    try {
      final response = await http.get(Uri.parse(Api.moviesLsitApi));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<MoviesModel> movieData =
            data.map((movie) => MoviesModel.fromJson(movie)).toList();
        sendPort.send(movieData);
      } else {
        throw Exception('Failed to load movies... \nSome error occured...');
      }
    } catch (e) {
      debugPrint(e.toString());
      sendPort.send("Error: $e");
    }
  }

//  without isolates
  // Future<void> moviesApiCall() async {
  //   try {
  //     final response = await http.get(Uri.parse(Api.moviesLsitApi));
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
  //       _movies = data.map((movie) => MoviesModel.fromJson(movie)).toList();
  //       notifyListeners();
  //     } else {
  //       throw Exception('Failed to load movies... \nSome error occured...');
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("error: ${e.toString()}");
  //     }
  //     throw e.toString();
  //   }
  // }
}
