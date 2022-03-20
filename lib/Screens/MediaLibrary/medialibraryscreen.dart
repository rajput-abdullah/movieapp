import 'package:flutter/material.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/widgets/common_widgets.dart';

class MediaLibraryScreen extends StatefulWidget {
  const MediaLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MediaLibraryScreen> createState() => _MediaLibraryScreenState();
}

class _MediaLibraryScreenState extends State<MediaLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: AppColors.whiteGrey,
        child: Center(
          child: CommonWidgets.customText(
              text: "Media Library",
              lines: 1,
              fontWeight: FontWeight.normal,
              fontSize: sizes.mediumFontSize,
              fontFamily: Assets.poppinsMedium,
              color: AppColors.darkBlue,
              alignment: TextAlign.center),
        ),
      ),
    ));
  }
}
