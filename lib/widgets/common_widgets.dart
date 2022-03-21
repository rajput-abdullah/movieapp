import 'package:flutter/material.dart';
import 'package:movieapp/globals/my_globals.dart';


class CommonWidgets {

  static Widget customText(
      {required String text,
        @required int? lines,
        @required fontWeight,
        required double fontSize,
        @required fontFamily,
        required final color,
        @required alignment}) {
    lines ??= 1;

    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: lines,
      textAlign: alignment,
      style: TextStyle(
          fontSize: MyGlobals.getFontRatio() * fontSize,
          color: color,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: fontFamily),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
