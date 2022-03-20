import 'package:flutter/material.dart';
import 'package:movieapp/Models/movie_detail_response.dart';
import 'package:movieapp/network_manager/api_url.dart';
import 'package:movieapp/network_manager/models.dart';
import 'package:movieapp/network_manager/my_api.dart';
import 'package:movieapp/res/toasts.dart';

class MovieWatchDetailProvider extends ChangeNotifier {
  BuildContext ?context;
  bool ? isApiHit;

  MovieDetailResponse movieDetailResponse = MovieDetailResponse();


  Future<void> init({@required BuildContext? context, required int movieId}) async {
    this.context = context;
    isApiHit=false;
    getMovieDetail(movieId);
  }


  Future<MovieDetailResponse> getMovieDetail(movieId) async {
    try {
      debugPrint("$movieDetailUrl/$movieId?api_key=$apiKey");
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      movieDetailResponse = await MyApi.callGetApi(
          url: "$movieDetailUrl/$movieId?",
          parameters: {
            "api_key": apiKey
          },
          myHeaders: header,
          modelName: Models.movieDetailResponse);
      isApiHit=true;
      notifyListeners();
    } catch (e) {
      Toasts.getWarningToast(text: "Something Went Wrong");
      debugPrint("Catch-Error: ${e.toString()}");
    }
    return movieDetailResponse;
  }

}