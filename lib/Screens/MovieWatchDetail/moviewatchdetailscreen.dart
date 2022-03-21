import 'package:flutter/material.dart';
import 'package:movieapp/Screens/MovieWatchDetail/moviedetailprovider.dart';
import 'package:movieapp/Screens/MovieWatchDetail/moviedetailscreencomponent.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:provider/provider.dart';

class MovieWatchDetailScreen extends StatefulWidget {
  final int ?movieId;
  final dynamic posterPath;
  const MovieWatchDetailScreen({Key? key, required this.movieId, required this.posterPath}) : super(key: key);

  @override
  State<MovieWatchDetailScreen> createState() => _MovieWatchDetailScreenState();
}

class _MovieWatchDetailScreenState extends State<MovieWatchDetailScreen> {
  MovieWatchDetailProvider ?movieWatchDetailProvider;

  @override
  void initState() {
    movieWatchDetailProvider =
        Provider.of<MovieWatchDetailProvider>(context, listen: false);
    movieWatchDetailProvider?.init(context: context, movieId: widget.movieId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieWatchDetailProvider>(context, listen: true);

    return Scaffold(
      body: Container(
        color: AppColors.whiteColor,
        height: sizes.height,
        width: sizes.width,
        child: movieWatchDetailProvider?.isApiHit??false ?
        SingleChildScrollView(
          child: Column(
            children: [
              MovieDetailScreenComponents.firstHalfScreen(movieWatchDetailProvider, widget.posterPath, context),
              MovieDetailScreenComponents.secondHalfScreen(movieWatchDetailProvider)
            ],
          ),
        ):Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
