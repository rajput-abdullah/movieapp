import 'package:flutter/material.dart';
import 'package:movieapp/Models/upcoming_movies_response.dart';
import 'package:movieapp/network_manager/api_url.dart';
import 'package:movieapp/network_manager/models.dart';
import 'package:movieapp/network_manager/my_api.dart';
import 'package:movieapp/res/toasts.dart';

class MovieWatchListProvider extends ChangeNotifier {
  BuildContext ?context;

  UpcomingMoviesResponse upcomingMoviesResponse = UpcomingMoviesResponse();


  Future<void> init({@required BuildContext? context}) async {
    this.context = context!;
  }


  Future<UpcomingMoviesResponse> getUpcomingMoviesList() async {
    try {
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      upcomingMoviesResponse = await MyApi.callGetApi(
          url:upcomingMovieUrl,
          myHeaders: header,
          modelName: Models.upcomingMoviesResponse);
      if (upcomingMoviesResponse.totalPages! >= 1) {
        notifyListeners();

      } else {
        Toasts.getSuccessToast(text: "No Upcoming Movie Found!! :(");
      }
    } catch (e) {
      debugPrint("Catch-Error: ${e.toString()}");
    }
    return upcomingMoviesResponse;
  }

}