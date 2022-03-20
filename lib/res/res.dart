import 'package:flutter/cupertino.dart';

import 'sizes.dart';

late AppSizes sizes;

bool _isInitialized = false;

void initializeResources({required BuildContext context}) {
  AppSizes().initializeSize(context);
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  sizes = AppSizes()..initializeSize(context);
}

double getHeight() => sizes.height;

double getWidth() => sizes.width;

double getWidthRatio() => sizes.widthRatio;

double getHeightRatio() => sizes.heightRatio;

double getFontRatio() => sizes.fontRatio;

