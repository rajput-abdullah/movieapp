import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/globals/my_globals.dart';
import 'colors.dart';

class Toasts {

  static getErrorToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: MyGlobals.getFontRatio() * 16.0
    );
  }

  static getSuccessToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
        fontSize: MyGlobals.getFontRatio() * 16.0
    );
  }

  static getWarningToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: MyGlobals.getFontRatio() * 16.0
    );
  }

}
