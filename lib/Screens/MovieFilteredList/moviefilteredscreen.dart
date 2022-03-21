import 'package:flutter/material.dart';
import 'package:movieapp/Models/movie_filtered_response.dart';
import 'package:movieapp/Screens/MovieWatchDetail/moviewatchdetailscreen.dart';
import 'package:movieapp/Screens/MovieWatchList/moviewatchlistcomponents.dart';
import 'package:movieapp/animations/slide_right.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/widgets/common_widgets.dart';

class MovieFilteredScreen extends StatefulWidget {
  final MovieFilteredResponse ?movieFilteredResponse;

  const MovieFilteredScreen({Key? key, required this.movieFilteredResponse})
      : super(key: key);

  @override
  State<MovieFilteredScreen> createState() => _MovieFilteredScreenState();
}

class _MovieFilteredScreenState extends State<MovieFilteredScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(
              margin: EdgeInsets.only(left: sizes.width*0.04),
              child: IconButton(icon: Icon(Icons.arrow_back_ios, color: AppColors.darkBlue,size: sizes.width*0.07,),onPressed: (){
                Navigator.pop(context);
              },),
            ),
            toolbarHeight: sizes.height * 0.09,
            title:CommonWidgets.customText(
                text: "${widget.movieFilteredResponse?.totalResults} result's found.",
                lines: 2,
                fontWeight: FontWeight.bold,
                fontSize: sizes.largeFontSize,
                fontFamily: Assets.poppinsMedium,
                color: AppColors.darkBlue,
                alignment: TextAlign.center),
            // typing??false ?,
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
          ),
          body: Container(
            height: sizes.height,
            width: sizes.width,
            color: AppColors.lightGrey,
            child: Column(
              children: [
            SizedBox(height: sizes.height*0.012,),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.movieFilteredResponse?.results?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            SlideRightRoute(
                                page: MovieWatchDetailScreen(
                                    movieId: widget.movieFilteredResponse?.results?[index].id,
                                    posterPath: widget.movieFilteredResponse?.results?[index].posterPath
                                )));
                      },
                      child: MovieWatchListComponents.movieCard(
                          widget.movieFilteredResponse?.results?[index].posterPath,
                          widget.movieFilteredResponse?.results?[index].originalTitle


                      ),
                    );
                  })),

              // FutureBuilder<MovieFilteredResponse>(
              //     future: widget.movieFilteredResponse,
              //     builder:(
              //         BuildContext context,
              //         AsyncSnapshot<MovieFilteredResponse> snapshot,
              //         ){
              //       if (snapshot.hasError) {
              //         return Text(
              //           snapshot.error.toString(),
              //           style: const TextStyle(color: Colors.red),
              //         );
              //       }
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Flexible(
              //           child: Center(
              //             child: CircularProgressIndicator(),
              //           ),
              //         );
              //       }
              //       if (snapshot.data!.results!.isNotEmpty) {
              //         return Flexible(
              //           child: ListView.builder(
              //               shrinkWrap: true,
              //               itemCount: snapshot.data?.results?.length,
              //               itemBuilder: (context, index) {
              //                 return GestureDetector(
              //                   onTap: ()
              //                   {
              //                     Navigator.push(
              //                         context,
              //                         SlideRightRoute(
              //                             page: MovieWatchDetailScreen(
              //                                 movieId: snapshot.data?.results?[index].id,
              //                                 posterPath: snapshot.data?.results?[index].posterPath
              //                             )));
              //
              //                   },
              //                   child: MovieWatchListComponents.movieCard(
              //                       snapshot.data?.results?[index].posterPath,
              //                       snapshot.data?.results?[index].originalTitle
              //
              //
              //                   ),
              //                 );
              //               }),
              //         );
              //       }
              //       else {
              //         return Flexible(
              //             child: Center(
              //                 child: CommonWidgets.customText(
              //                     text: "No Upcoming Movie Found!",
              //                     lines: 2,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: getHeightRatio() * 20,
              //                     fontFamily: Assets.poppinsMedium,
              //                     color: AppColors.darkBlue,
              //                     alignment: TextAlign.center)));
              //       }
              //     }),

              ],
            ),
          ),
        ));
  }
}
