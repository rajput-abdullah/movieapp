import 'package:flutter/material.dart';
import 'package:movieapp/globals/my_globals.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/res/toasts.dart';


class CommonWidgets {
  // static double getWidthRatio() => sizes?.widthRatio ?? 1;
  //
  // static double getHeightRatio() => sizes?.heightRatio ?? 1;
  //
  // static double getFontRatio() => sizes?.fontRatio ?? 1.0;

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

  static Widget textButton(
      {required String text,
        @required int? lines,
        required double fontSize,
        @required fontFamily,
        required final color,
        @required alignment}) {
    lines ??= 1;

    return TextButton(
      onPressed: () {},
      child: CommonWidgets.customText(
        text: text,
        lines: lines,
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
        alignment: alignment,
      ),
    );
  }

  static Widget customTextField(
      {@required maxLength,
        @required controller,
        @required textType,
        @required boolOnTap,
        required placeHolder,

        required image}) {
    return TextField(
      controller: controller,
      maxLength: maxLength ?? 500,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textType,
      style: TextStyle(
          color: AppColors.blackColor,
          fontFamily: Assets.poppinsMedium,
          fontSize: getFontRatio() * 15),
      decoration: boolOnTap ? InputDecoration(
        fillColor: AppColors.darkGrey,
          hintStyle: TextStyle(
              color: AppColors.lightGrey.withOpacity(0.5),
              fontFamily: Assets.poppinsMedium,
              fontSize: getFontRatio() * 12),
          counterText: "",
          hintText: placeHolder ?? "",
          suffixIcon: IconButton(onPressed: ()
            {
              Toasts.getSuccessToast(text: 'done');

            },icon: Icon(Icons.clear, color: AppColors.textColor,),),
          contentPadding: EdgeInsets.only(bottom: getHeightRatio() * 0),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: AppColors.textColor,))
      :
      InputDecoration(
          filled: false,
          hintStyle: TextStyle(
              color: AppColors.textColor,
              fontFamily: Assets.poppinsMedium,
              fontSize: getFontRatio() * 12),
          counterText: "",
          hintText: "Watch",
          suffixIcon: Icon(Icons.search, color: AppColors.textColor,),
          contentPadding: EdgeInsets.only(bottom: getHeightRatio() * 0),
          border: InputBorder.none,
      ),
    );
  }

  static Widget customTextFieldWithCustomLines(
      {@required controller, required placeHolder, required lines}) {
    return Container(
      width: getWidthRatio() * 325,
      height: getHeightRatio() * 50,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.top,
          maxLines: lines,
          style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: Assets.poppinsMedium,
              fontSize: getFontRatio() * 15),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                color: AppColors.lightGrey.withOpacity(0.5),
                fontFamily: Assets.poppinsMedium,
                fontSize: getFontRatio() * 12),
            hintText: placeHolder ?? "",
            hintMaxLines: lines,
            contentPadding: EdgeInsets.symmetric(
                horizontal: getWidthRatio() * 12,
                vertical: getHeightRatio() * 12),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  static Widget customTextFieldWithCustomLinesAndIcon(
      {required icon, required placeHolder, required lines}) {
    return Container(
      width: getWidthRatio() * 325,
      height: getHeightRatio() * 100,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: TextField(
          maxLength: 1500,
          // ignore: deprecated_member_use
          maxLengthEnforced: true,
          textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.multiline,
          maxLines: null,

          decoration: InputDecoration(
            counterText: "",
            prefixIcon: Image.asset(
              icon,
              height: getHeightRatio() * 12,
              width: getHeightRatio() * 12,
              cacheHeight: 20,
              cacheWidth: 20,
            ),
            hintText: placeHolder ?? "",
            hintMaxLines: lines,
            hintStyle: TextStyle(
                color: AppColors.lightGrey,
                fontFamily: Assets.poppinsMedium,
                fontSize: getFontRatio() * 12),
            contentPadding: EdgeInsets.symmetric(
                horizontal: getWidthRatio() * 12,
                vertical: getHeightRatio() * 12),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  static Widget customTextFieldWithSuffixIon(
      {required placeHolder, required image}) {
    return Container(
      width: getWidthRatio() * 325,
      height: getHeightRatio() * 50,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: placeHolder ?? "",
              hintStyle: TextStyle(
                  color: AppColors.lightGrey,
                  fontFamily: Assets.poppinsMedium,
                  fontSize: getFontRatio() * 12),
              contentPadding: EdgeInsets.only(
                  bottom: getHeightRatio() * 0, left: getHeightRatio() * 15),
              border: InputBorder.none,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidthRatio() * 12,
                    vertical: getHeightRatio() * 12),
                child: Image.asset(
                  image,
                ),
              )),
        ),
      ),
    );
  }

  static Widget customTextFieldWithSuffixIconAndPrefixIcon(
      {@required isReadOnly,
        @required maxLength,
        @required controller,
        @required textType,
        required placeHolder,
        required image,
        required suffixImage}) {
    return Container(
      width: getWidthRatio() * 325,
      height: getHeightRatio() * 50,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          maxLength: maxLength,
          readOnly: isReadOnly ?? false,
          controller: controller,
          keyboardType: textType,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: Assets.poppinsMedium,
              fontSize: getFontRatio() * 15),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: AppColors.lightGrey.withOpacity(0.5),
                  fontFamily: Assets.poppinsMedium,
                  fontSize: getFontRatio() * 12),
              counterText: "",
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidthRatio() * 12,
                    vertical: getHeightRatio() * 12),
                child: Image.asset(
                  suffixImage,
                  height: getHeightRatio() * 18,
                  width: getHeightRatio() * 18,
                ),
              ),
              hintText: placeHolder ?? "",
              contentPadding: EdgeInsets.only(bottom: getHeightRatio() * 0),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidthRatio() * 12,
                    vertical: getHeightRatio() * 12),
                child: Image.asset(
                  image,
                  height: getHeightRatio() * 17,
                  width: getHeightRatio() * 17,
                ),
              )),
        ),
      ),
    );
  }

  static Widget customTextFieldPassword(
      {required placeHolder, required image, @required controller}) {
    return Container(
      width: getWidthRatio() * 325,
      height: getHeightRatio() * 50,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: placeHolder ?? "",
            hintStyle: TextStyle(
                color: AppColors.lightGrey,
                fontFamily: Assets.poppinsMedium,
                fontSize: getFontRatio() * 12),
            contentPadding: EdgeInsets.only(bottom: getHeightRatio() * 0),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidthRatio() * 12,
                  vertical: getHeightRatio() * 12),
              child: Image.asset(
                image,
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidthRatio() * 17,
                  vertical: getHeightRatio() * 17),
              child: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  static Widget mainButton({required text, required onPress}) {
    return Container(
      width: getWidthRatio() * 325,
      height: getHeightRatio() * 50,
      decoration: const BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: CommonWidgets.customText(
            text: text,
            lines: 1,
            fontSize: 16,
            fontFamily: Assets.poppinsMedium,
            color: AppColors.whiteColor,
            alignment: TextAlign.center),
      ),
    );
  }

  static Widget acceptedOrRejectedButton(
      {required text, required onPress, required color}) {
    return Container(
      width: getWidthRatio() * 325,
      height: getHeightRatio() * 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.textFieldShadow,
        //     blurRadius: 15,
        //     offset: Offset(0, 8),
        //   ),
        // ],
      ),
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: CommonWidgets.customText(
            text: text,
            lines: 1,
            fontSize: 16,
            fontFamily: Assets.poppinsMedium,
            color: AppColors.whiteColor,
            alignment: TextAlign.center),
      ),
    );
  }

  static Widget customBackButton({required context, @required onPress}) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress.call();
        } else {
          Navigator.pop(context);
        }
      },
      child: Icon(Icons.arrow_back_ios),

      // child: Container(
      //   width: getWidthRatio() * 32,
      //   height: getHeightRatio() * 32,
      //   padding: EdgeInsets.symmetric(
      //       horizontal: getWidthRatio() * 7, vertical: getHeightRatio() * 7),
      //   decoration: const BoxDecoration(
      //     color: AppColors.iconBackgroundColor,
      //     borderRadius: BorderRadius.all(Radius.circular(6)),
      //   ),
      //   child: Icon(Icons.arrow_back_ios),
      // ),
    );
  }
//   static AppBar customAppBarMainScreens(
//       {@required centerTitleBool,
//         required Widget widget,
//         required BuildContext context,
//         @required icon,
//         @required String? routeName,
//         required Function() addNewItem}) {
//     return AppBar(
//       toolbarHeight: getWidthRatio() * 70,
//       elevation: 3,
//       backgroundColor: AppColors.whiteColor,
//       centerTitle: centerTitleBool,
//       iconTheme: const IconThemeData(
//         color: AppColors.iconColor, //change your color here
//       ),
//       leading: Container(
//         // height:10,
//         // width: getWidthRatio() *40,
//         // height: getHeightRatio() * 50,
//         margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
//         decoration: BoxDecoration(
//             color: AppColors.iconBackgroundColor,
//             borderRadius: BorderRadius.circular(6)),
//         child: Builder(
//           builder: (context) => IconButton(
//             icon: const ImageIcon(AssetImage(
//               Assets.drawerMenuIcon,
//             )),
//             onPressed: () => Scaffold.of(context).openDrawer(),
//           ),
//         ),
//       ),
//       automaticallyImplyLeading: false,
//       // automaticallyImplyLeading: true,
//       // leading: BackButton(
//       //   color: AppColors.blackColor,
//       // ),
//       title: widget,
//       actions: [
//         icon == null
//             ? Container()
//             : Container(
//           margin: const EdgeInsets.only(right: 15, top: 20, bottom: 20),
//           child: IconButton(
//             onPressed: () {
//               addNewItem();
//               // PreferenceUtils.clearPreferences();
//             },
//             icon: icon,
//             color: AppColors.iconColor,
//             iconSize: 20,
//           ),
//           decoration: BoxDecoration(
//               color: AppColors.iconBackgroundColor,
//               borderRadius: BorderRadius.circular(6)),
//         ),
//       ],
//     );
// // }
//   }

//   static AppBar customAppBarWithoutActionIcon(
//       {@required centerTitleBool,
//         required Widget widget,
//         required BuildContext context}) {
//     return AppBar(
//       toolbarHeight: getWidthRatio() * 70,
//       elevation: 3,
//       backgroundColor: AppColors.whiteColor,
//       centerTitle: false,
//       iconTheme: const IconThemeData(
//         color: AppColors.iconColor, //change your color here
//       ),
//       leading: Container(
//         // height:10,
//         // width: getWidthRatio() *40,
//         // height: getHeightRatio() * 50,
//         margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
//         decoration: BoxDecoration(
//             color: AppColors.iconBackgroundColor,
//             borderRadius: BorderRadius.circular(6)),
//         child: Builder(
//           builder: (context) => IconButton(
//             icon: const ImageIcon(AssetImage(
//               Assets.drawerMenuIcon,
//             )),
//             onPressed: () => Scaffold.of(context).openDrawer(),
//           ),
//         ),
//       ),
//       automaticallyImplyLeading: false,
//       // automaticallyImplyLeading: true,
//       // leading: BackButton(
//       //   color: AppColors.blackColor,
//       // ),
//       title: widget,
//     );
// // }
//   }

//   static AppBar customSimpleAppBarWithBackButton(
//       {required Widget widget,
//         required BuildContext context,
//         required onPress}) {
//     return AppBar(
//       toolbarHeight: getWidthRatio() * 70,
//       elevation: 3,
//       backgroundColor: AppColors.whiteColor,
//       centerTitle: false,
//       iconTheme: const IconThemeData(
//         color: AppColors.iconColor, //change your color here
//       ),
//       leading: Container(
//         margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
//         child: CommonWidgets.customBackButton(
//             context: context,
//             onPress: () {
//               Navigator.pop(context);
//             }),
//       ),
//       automaticallyImplyLeading: false,
//       // automaticallyImplyLeading: true,
//       // leading: BackButton(
//       //   color: AppColors.blackColor,
//       // ),
//       title: widget,
//     );
// // }
//   }

// class CommonWidgets {
//   static double getWidthRatio() => sizes?.widthRatio ?? 1;
//
//   static double getHeightRatio() => sizes?.heightRatio ?? 1;
//
//   static double getFontRatio() => sizes?.fontRatio ?? 1.0;
//
//   static Widget customText(
//       {required String text,
//       @required int? lines,
//       required double fontSize,
//       required fontFamily,
//       required final color}) {
//     return Text(
//       text,
//       softWrap: true,
//       overflow: TextOverflow.ellipsis,
//       maxLines: lines,
//       style: TextStyle(
//         fontSize: getFontRatio() * fontSize,
//         fontFamily: fontFamily,
//         color: color,
//       ),
//     );
//   }
//
//   static Widget mainButton(
//       {required double width,
//       required double height,
//       @required double? cornerRadius,
//       @required Function? onPress,
//       required String text}) {
//     cornerRadius ??= 10;
//
//     return Container(
//       width: getWidthRatio() * width,
//       height: getHeightRatio() * height,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: AppColors.appTheme,
//           width: 1,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
//         color: AppColors.appTheme,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.mainButtonShadow,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: TextButton(
//         onPressed: () {
//           if (onPress != null) {
//             onPress.call();
//           }
//         },
//         child: Text(
//           text,
//           style: TextStyle(
//             color: AppColors.blackColor,
//             fontSize: getFontRatio() * 18,
//             fontFamily: Assets.robotoBold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Widget customTextFieldNoIcon(
//       {required String placeHolder,
//       @required dynamic controller,
//       @required double? height}) {
//     height ??= 50;
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: getWidthRatio() * 10),
//       width: getWidthRatio() * 321,
//       height: getHeightRatio() * height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         color: AppColors.whiteColor,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.mainButtonShadow,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: TextField(
//         textAlignVertical: TextAlignVertical.center,
//         controller: controller,
//         decoration: InputDecoration(
//           hintText: placeHolder,
//           hintStyle: TextStyle(
//               color: AppColors.blackColor.withOpacity(0.6),
//               fontFamily: Assets.robotoRegular,
//               fontSize: getFontRatio() * 16),
//           //contentPadding: EdgeInsets.only(bottom: sizes!.heightRatio * 10),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
//
//   static Widget customChatTextField(
//       {required String placeHolder,
//       @required dynamic controller,
//       @required double? height}) {
//     height ??= 50;
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: getWidthRatio() * 10),
//       width: getWidthRatio() * 255,
//       height: getHeightRatio() * height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         color: AppColors.whiteColor,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.mainButtonShadow,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: TextField(
//         textAlignVertical: TextAlignVertical.center,
//         controller: controller,
//         decoration: InputDecoration(
//           hintText: placeHolder,
//           hintStyle: TextStyle(
//               color: AppColors.blackColor.withOpacity(0.6),
//               fontFamily: Assets.robotoRegular,
//               fontSize: getFontRatio() * 16),
//           //contentPadding: EdgeInsets.only(bottom: sizes!.heightRatio * 10),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
//
//   static Widget customTextFieldPassword(
//       {required String placeHolder,
//       @required bool? hidePassword,
//       @required Function? onPress,
//       @required dynamic controller,
//       @required double? height}) {
//     height ??= 50;
//     hidePassword ??= true;
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: getWidthRatio() * 10),
//       width: getWidthRatio() * 321,
//       height: getHeightRatio() * height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         color: AppColors.whiteColor,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.mainButtonShadow,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: TextField(
//         textAlignVertical: TextAlignVertical.center,
//         controller: controller,
//         obscureText: hidePassword,
//         decoration: InputDecoration(
//           hintText: placeHolder,
//           hintStyle: TextStyle(
//               color: AppColors.blackColor.withOpacity(0.6),
//               fontFamily: Assets.robotoRegular,
//               fontSize: getFontRatio() * 16),
//           //contentPadding: EdgeInsets.only(bottom: sizes!.heightRatio * 10),
//           border: InputBorder.none,
//           suffixIcon: IconButton(
//             icon: Icon(
//               hidePassword ? Icons.visibility : Icons.visibility_off,
//             ),
//             color: AppColors.blackColor.withOpacity(0.6),
//             onPressed: () {
//               if (onPress != null) onPress.call();
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Widget customTextFieldIcon(
//       {required String placeHolder,
//       required IconData icon,
//       @required dynamic controller,
//       @required double? height,
//       @required bool? password}) {
//     height ??= 50;
//     password ??= false;
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: getWidthRatio() * 10),
//       width: getWidthRatio() * 321,
//       height: getHeightRatio() * height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         color: AppColors.whiteColor,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.mainButtonShadow,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: TextField(
//         textAlignVertical: TextAlignVertical.center,
//         controller: controller,
//         obscureText: password,
//         decoration: InputDecoration(
//           hintText: placeHolder,
//           hintStyle: TextStyle(
//               color: AppColors.blackColor.withOpacity(0.6),
//               fontFamily: Assets.robotoRegular,
//               fontSize: getFontRatio() * 16),
//           //contentPadding: EdgeInsets.only(bottom: sizes!.heightRatio * 10),
//           border: InputBorder.none,
//           suffixIcon: Icon(
//             icon,
//             color: AppColors.appTheme,
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Widget containerWithIcon(
//       {required String text,
//       required String icon,
//       required var color,
//       @required double? height,
//       @required Function? onPress}) {
//     height ??= 50;
//
//     return GestureDetector(
//       onTap: () {
//         if (onPress != null) onPress.call();
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: getWidthRatio() * 10),
//         width: getWidthRatio() * 321,
//         height: getHeightRatio() * height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           color: AppColors.whiteColor,
//           boxShadow: [
//             BoxShadow(
//               color: AppColors.mainButtonShadow,
//               blurRadius: 6,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             customText(
//                 text: text,
//                 lines: 1,
//                 fontSize: 16,
//                 fontFamily: Assets.robotoRegular,
//                 color: AppColors.blackColor.withOpacity(0.6)),
//             Spacer(),
//             ImageIcon(
//               AssetImage(icon),
//               color: color,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   static Widget containerWithoutIcon(
//       {required String text, @required double? height, @required Function? onPress}) {
//     height ??= 50;
//
//     return GestureDetector(
//       onTap: () {
//         if (onPress != null) onPress.call();
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: getWidthRatio() * 10),
//         width: getWidthRatio() * 321,
//         height: getHeightRatio() * height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           color: AppColors.whiteColor,
//           boxShadow: [
//             BoxShadow(
//               color: AppColors.mainButtonShadow,
//               blurRadius: 6,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: customText(
//               text: text,
//               lines: 1,
//               fontSize: 16,
//               fontFamily: Assets.robotoRegular,
//               color: AppColors.blackColor.withOpacity(0.6)),
//         ),
//       ),
//     );
//   }
//
//   static AppBar customAppBar({required Widget widget, required BuildContext context}) {
//     return AppBar(
//       backgroundColor: AppColors.appTheme,
//       centerTitle: true,
//       automaticallyImplyLeading: true,
//       leading: BackButton(
//         color: AppColors.blackColor,
//       ),
//       title: widget,
//       actions: [
//         IconButton(
//           onPressed: () {
//             PreferenceUtils.clearPreferences();
//             Navigator.pushNamedAndRemoveUntil(context, Routes.splash, (route) => false);
//           },
//           icon: ImageIcon(AssetImage(Assets.logoutIcon)),
//           color: AppColors.blackColor,
//           iconSize: 20,
//         ),
//       ],
//     );
//   }
//
//   static AppBar customAppBarMainScreens(
//       {required Widget widget, required BuildContext context}) {
//     return AppBar(
//       backgroundColor: AppColors.appTheme,
//       centerTitle: true,
//       // automaticallyImplyLeading: true,
//       automaticallyImplyLeading: false,
//       // leading: BackButton(
//       //   color: AppColors.blackColor,
//       // ),
//       title: widget,
//       actions: [
//         IconButton(
//           onPressed: () {
//             PreferenceUtils.clearPreferences();
//             Navigator.pushNamedAndRemoveUntil(context, Routes.splash, (route) => false);
//           },
//           icon: ImageIcon(AssetImage(Assets.logoutIcon)),
//           color: AppColors.blackColor,
//           iconSize: 20,
//         ),
//       ],
//     );
//   }
// }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
