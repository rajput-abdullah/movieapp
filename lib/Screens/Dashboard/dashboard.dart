import 'package:flutter/material.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/widgets/common_widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: AppColors.whiteGrey,
        child: Center(
          child: CommonWidgets.customText(
              text: "Dashboard",
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
