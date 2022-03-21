import 'package:flutter/material.dart';
import 'package:movieapp/Models/movie_filtered_response.dart';
import 'package:movieapp/Models/upcoming_movies_response.dart';
import 'package:movieapp/network_manager/api_url.dart';
import 'package:movieapp/network_manager/models.dart';
import 'package:movieapp/network_manager/my_api.dart';
import 'package:movieapp/res/toasts.dart';

class MovieWatchListProvider extends ChangeNotifier {
  MovieFilteredResponse movieFilteredResponse = MovieFilteredResponse();
  BuildContext ?context;
  TextEditingController? searchController;
  UpcomingMoviesResponse upcomingMoviesResponse = UpcomingMoviesResponse();
  bool ?isFilteredApiHit;


  Future<void> init({@required BuildContext? context}) async {
    this.context = context!;
    isFilteredApiHit = false;
    searchController =TextEditingController();
  }


  Future<UpcomingMoviesResponse> getUpcomingMoviesList() async {
    try {
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      upcomingMoviesResponse = await MyApi.callGetApi(
          url:upcomingMovieUrl,
          myHeaders: header,
          modelName: Models.upcomingMoviesResponse);
      if (upcomingMoviesResponse.totalPages! >= 1) {
        // notifyListeners();

      } else {
        Toasts.getSuccessToast(text: "No Upcoming Movie Found!! :(");
      }
    } catch (e) {
      debugPrint("Catch-Error: ${e.toString()}");
    }
    return upcomingMoviesResponse;
  }
  Future<MovieFilteredResponse> getUpcomingMoviesFilteredList(query) async {
    try {
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      movieFilteredResponse = await MyApi.callGetApi(
          url:movieSearchUrl,
          parameters: {
            "api_key": apiKey,
            "language" : "en-US",
            "page":1,
            "include_adult":false,
            "query":query
          },
          myHeaders: header,
          modelName: Models.movieFilteredResponse);
      if (movieFilteredResponse.totalPages! >= 1) {
        isFilteredApiHit=true;
        notifyListeners();

      } else {
        Toasts.getSuccessToast(text: "No Upcoming Movie Found!! :(");
      }
    } catch (e) {
      debugPrint("Catch-Error: ${e.toString()}");
    }
    return movieFilteredResponse;
  }

}