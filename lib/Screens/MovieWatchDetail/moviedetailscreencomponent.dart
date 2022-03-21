import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:movieapp/Screens/MovieWatchTrailer/moviewatchtrailerscreen.dart';
import 'package:movieapp/animations/slide_right.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/res/toasts.dart';
import 'package:movieapp/widgets/common_widgets.dart';

class MovieDetailScreenComponents {
  static Widget secondHalfScreen(movieWatchDetailProvider) {
    return Container(
      height: sizes.height * 0.48,
      margin: EdgeInsets.symmetric(
          horizontal: sizes.width * 0.08, vertical: sizes.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidgets.customText(
              text: "Genres",
              lines: 1,
              fontWeight: FontWeight.normal,
              fontSize: sizes.largeFontSize,
              fontFamily: Assets.poppinsMedium,
              color: AppColors.darkBlue,
              alignment: TextAlign.left),
          Flexible(
            child: SizedBox(
              height: sizes.height * 0.045,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movieWatchDetailProvider
                      ?.movieDetailResponse.genres?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: sizes.width * 0.03),
                      margin: EdgeInsets.only(
                        top: sizes.width * 0.03,
                        right: sizes.width * 0.03,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(sizes.width * 0.02),
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)]),
                      child: CommonWidgets.customText(
                          text:
                              "${movieWatchDetailProvider?.movieDetailResponse.genres?[index].name}",
                          lines: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: sizes.mediumFontSize,
                          fontFamily: Assets.poppinsMedium,
                          color: AppColors.whiteColor,
                          alignment: TextAlign.center),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: sizes.height * 0.010,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: sizes.height * 0.001,
          ),
          CommonWidgets.customText(
              text: "Overview",
              lines: 1,
              fontWeight: FontWeight.normal,
              fontSize: sizes.largeFontSize,
              fontFamily: Assets.poppinsMedium,
              color: AppColors.darkBlue,
              alignment: TextAlign.left),
          SizedBox(
            height: sizes.height * 0.005,
          ),
          CommonWidgets.customText(
              text: "${movieWatchDetailProvider?.movieDetailResponse.overview}",
              lines: 12,
              fontWeight: FontWeight.normal,
              fontSize: sizes.mediumFontSize,
              fontFamily: Assets.poppinsMedium,
              color: AppColors.darkGrey,
              alignment: TextAlign.justify),
        ],
      ),
    );
  }

  static Widget firstHalfScreen(movieWatchDetailProvider, posterPath, context) {
    return SizedBox(
      height: sizes.height * 0.45,
      child: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/w500${posterPath}",
            fit: BoxFit.fitWidth,
            width: sizes.width,
            height: sizes.height * 0.5,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(
                left: sizes.height * 0.04, top: sizes.height * 0.03),
            height: sizes.height * 0.08,
            width: sizes.width * 0.7,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.darkBlue,
                      size: sizes.height * 0.03,
                    )),
                CommonWidgets.customText(
                    text: "   Watch",
                    lines: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: sizes.largeFontSize,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.darkBlue,
                    alignment: TextAlign.left),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: sizes.height * 0.015,
                ),
                CommonWidgets.customText(
                    text:
                        "${movieWatchDetailProvider?.movieDetailResponse.originalTitle}",
                    lines: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: sizes.largeFontSize,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.darkYellow,
                    alignment: TextAlign.center),
                SizedBox(
                  height: sizes.height * 0.005,
                ),
                CommonWidgets.customText(
                    text:
                        "In theaters ${Jiffy(movieWatchDetailProvider?.movieDetailResponse.releaseDate).format('do MMM, yyyy')}",
                    lines: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: sizes.mediumLargeFontSize,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.whiteColor,
                    alignment: TextAlign.center),
                SizedBox(
                  height: sizes.height * 0.020,
                ),
                MaterialButton(
                  height: sizes.height * 0.065,
                  minWidth: sizes.width * 0.55,
                  color: AppColors.lightBlue,
                  disabledColor: AppColors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(sizes.width * 0.03)),
                  onPressed: () {},
                  child: CommonWidgets.customText(
                      text: "Get Started",
                      lines: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: sizes.mediumFontSize,
                      fontFamily: Assets.poppinsMedium,
                      color: AppColors.whiteColor,
                      alignment: TextAlign.center),
                ),
                SizedBox(
                  height: sizes.height * 0.015,
                ),
                MaterialButton(
                  height: sizes.height * 0.065,
                  minWidth: sizes.width * 0.55,
                  color: AppColors.transparentColor,
                  disabledColor: AppColors.transparentColor,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.whiteColor),
                      borderRadius: BorderRadius.circular(sizes.width * 0.03)),
                  onPressed: () {
                    if (movieWatchDetailProvider
                        .getMovieTrailerVideoListResponse.results!.isNotEmpty) {
                      Navigator.push(
                          context,
                          SlideRightRoute(
                              page: MovieWatchTrailerScreen(
                                  trailerKey: movieWatchDetailProvider
                                      .getMovieTrailerVideoListResponse
                                      .results?[0]
                                      .key)));
                    } else {
                      Toasts.getWarningToast(
                          text: "No Trailer Found For this Movie");
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: AppColors.whiteColor,
                      ),
                      CommonWidgets.customText(
                          text: " Watch Trailer",
                          lines: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: sizes.mediumFontSize,
                          fontFamily: Assets.poppinsMedium,
                          color: AppColors.whiteColor,
                          alignment: TextAlign.center),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizes.height * 0.025,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
