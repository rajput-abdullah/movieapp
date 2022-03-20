import 'package:flutter/material.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/widgets/common_widgets.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: AppColors.whiteGrey,
        child: Center(
          child: CommonWidgets.customText(
              text: "More Screen",
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
