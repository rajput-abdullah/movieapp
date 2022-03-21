import 'package:flutter/material.dart';
import 'package:movieapp/Models/get_movie_trailer_video_list_response.dart';
import 'package:movieapp/Models/movie_detail_response.dart';
import 'package:movieapp/network_manager/api_url.dart';
import 'package:movieapp/network_manager/models.dart';
import 'package:movieapp/network_manager/my_api.dart';
import 'package:movieapp/res/toasts.dart';

class MovieWatchDetailProvider extends ChangeNotifier {
  BuildContext? context;
  bool? isApiHit;
  MovieDetailResponse movieDetailResponse = MovieDetailResponse();
  GetMovieTrailerVideoListResponse getMovieTrailerVideoListResponse =
      GetMovieTrailerVideoListResponse();

  Future<void> init(
      {@required BuildContext? context, required int movieId}) async {
    this.context = context;
    isApiHit = false;
    int movie_id = movieId;
    getMovieDetail(movie_id);
    getMovieVideoList(movie_id);
  }

  Future<MovieDetailResponse> getMovieDetail(movieId) async {
    try {
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      movieDetailResponse = await MyApi.callGetApi(
          url: "$movieDetailUrl/$movieId?",
          parameters: {"api_key": apiKey},
          myHeaders: header,
          modelName: Models.movieDetailResponse);
      isApiHit = true;
      notifyListeners();
    } catch (e) {
      Toasts.getWarningToast(text: "Something Went Wrong");
      debugPrint("Catch-Error: ${e.toString()}");
    }
    return movieDetailResponse;
  }

  Future<GetMovieTrailerVideoListResponse> getMovieVideoList(movieId) async {
    try {
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      getMovieTrailerVideoListResponse = await MyApi.callGetApi(
          url: "$movieDetailUrl/$movieId/videos?",
          parameters: {"api_key": apiKey, "language": "en-US"},
          myHeaders: header,
          modelName: Models.getMovieTrailerVideoListResponse);
      if (getMovieTrailerVideoListResponse.results!.isNotEmpty) {
        notifyListeners();
      }
    } catch (e) {
      Toasts.getWarningToast(text: "Something Went Wrong");
      debugPrint("Catch-Error: ${e.toString()}");
    }
    return getMovieTrailerVideoListResponse;
  }
}
