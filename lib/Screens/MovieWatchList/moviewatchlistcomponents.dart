import 'package:flutter/material.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/widgets/common_widgets.dart';

class MovieWatchListComponents {
  static Widget movieCard(imageUrl, movieName ) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: sizes.width*0.055, vertical: sizes.height*0.012),
            height: sizes.height*0.2,
            width: double.maxFinite,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(sizes.width*0.02),
                  child: Image.network("https://image.tmdb.org/t/p/w500$imageUrl",
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,

                    height: sizes.height*0.2,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(sizes.width*0.02),

                    child: CommonWidgets.customText(text: "$movieName", lines: 1, fontWeight: FontWeight.normal, fontSize: sizes.mediumFontSize, fontFamily: Assets.poppinsMedium, color: AppColors.whiteColor, alignment: TextAlign.left))
              ],
            ),

        );
  }
}
