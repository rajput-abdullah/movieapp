import 'package:flutter/cupertino.dart';
import 'package:movieapp/res/res.dart';

class CommonPadding {
  static final commonWidthPadding30 = sizes.widthRatio * 30.0;
  static final commonHeightPadding30 = sizes.heightRatio * 30.0;

  static final commonWidthPadding20 = sizes.widthRatio * 20.0;
  static final commonHeightPadding20 = sizes.heightRatio * 20.0;

  static final getCommonPaddingLeftAndRightWidth30 =
      EdgeInsets.only(left: commonWidthPadding30, right: commonWidthPadding30);

  static final getCommonPaddingLeftAndRightWidth20 =
      EdgeInsets.only(left: commonWidthPadding20, right: commonWidthPadding20);
}
