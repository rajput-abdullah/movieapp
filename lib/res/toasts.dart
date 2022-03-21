import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/globals/my_globals.dart';
import 'colors.dart';

class Toasts {
  //custom toasts class

  static getErrorToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.redColor,
        textColor: AppColors.whiteColor,
        fontSize: MyGlobals.getFontRatio() * 16.0
    );
  }

  static getSuccessToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.lightBlue,
        textColor: AppColors.whiteColor,
        fontSize: MyGlobals.getFontRatio() * 16.0
    );
  }

  static getWarningToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.darkYellow,
        textColor: AppColors.whiteColor,
        fontSize: MyGlobals.getFontRatio() * 16.0
    );
  }

}
