import 'package:movieapp/Models/error_response.dart';
import 'package:movieapp/Models/get_movie_trailer_video_list_response.dart';
import 'package:movieapp/Models/movie_detail_response.dart';
import 'package:movieapp/Models/movie_filtered_response.dart';
import 'package:movieapp/Models/upcoming_movies_response.dart';

class Models {
  static const String errorModel = "errorModel";
  static const String upcomingMoviesResponse = "upcomingMoviesResponse";
  static const String movieDetailResponse = "movieDetailResponse";
  static const String movieFilteredResponse = "movieFilteredResponse";
  static const String getMovieTrailerVideoListResponse =
      "getMovieTrailerVideoListResponse";

  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case errorModel:
        return ErrorResponse.fromJson(json);
      case upcomingMoviesResponse:
        return UpcomingMoviesResponse.fromJson(json);
      case movieDetailResponse:
        return MovieDetailResponse.fromJson(json);
      case movieFilteredResponse:
        return MovieFilteredResponse.fromJson(json);
      case getMovieTrailerVideoListResponse:
        return GetMovieTrailerVideoListResponse.fromJson(json);
    }
  }
}
