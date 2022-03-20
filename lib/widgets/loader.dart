
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/res.dart';

class Loader {
  showLoader({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Container(
              height: sizes.height * 0.35,
              width: sizes.width * 0.35,
              child: Lottie.asset(Assets.apiLoading),
            ),
          ),
        );
      },
    );
  }

  hideLoader({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}
