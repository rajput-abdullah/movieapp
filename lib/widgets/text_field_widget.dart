// import 'package:flutter/material.dart';
// import 'package:movieapp/res/colors.dart';
//
//
// class TextFieldWidget extends StatelessWidget {
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final TextInputType keyBoardType;
//   final TextInputAction textInputAction;
//   final VoidCallback? onTap;
//   final ValueChanged? onChanged;
//   final VoidCallback? onEditingComplete;
//   final ValueChanged? onFieldSubmitted;
//   final String? Function(String?)? validator;
//   final String? hint;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final VoidCallback? suffixOnTap;
//   final double prefixPaddingHorizontal;
//   final double prefixPaddingVertical;
//   final double suffixPaddingHorizontal;
//   final double suffixPaddingVertical;
//   final bool obscureText;
//   final int? maxLines;
//   final int? minLines;
//   final bool expands;
//   final double? height;
//   final bool isBorderEnabled;
//   final dynamic formatter;
//
//   const TextFieldWidget({
//     Key? key,
//     this.controller,
//     this.focusNode,
//     this.keyBoardType = TextInputType.text,
//     this.textInputAction = TextInputAction.done,
//     this.onTap,
//     this.onChanged,
//     this.onEditingComplete,
//     this.onFieldSubmitted,
//     this.validator,
//     this.hint,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.suffixOnTap,
//     this.prefixPaddingHorizontal = 15.0,
//     this.prefixPaddingVertical = 14.0,
//     this.suffixPaddingHorizontal = 14.0,
//     this.suffixPaddingVertical = 16.0,
//     this.obscureText = false,
//     this.maxLines = 1,
//     this.minLines,
//     this.expands = false,
//     this.height,
//     this.isBorderEnabled = false,
//     this.formatter
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: sizes.width,
//       // height: height ?? sizes.heightRatio * 50,
//       constraints: BoxConstraints(
//         minHeight: height ?? sizes.heightRatio * 50,
//         minWidth: sizes.width,
//       ),
//       decoration: BoxDecoration(
//         color: AppColors.whiteColor,
//         borderRadius: const BorderRadius.all(
//           Radius.circular(12.0),
//         ),
//         border: isBorderEnabled
//             ? Border.all(
//                 color: AppColors.primaryColor,
//               )
//             : null,
//         boxShadow: const [
//           BoxShadow(
//             color: AppColors.textFieldShadow,
//             blurRadius: 15,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Align(
//         alignment: Alignment.topLeft,
//         child: TextFormField(
//           controller: controller,
//           focusNode: focusNode,
//           keyboardType: keyBoardType,
//           textInputAction: textInputAction,
//           onTap: onTap,
//           onChanged: onChanged,
//           onEditingComplete: onEditingComplete,
//           onFieldSubmitted: onFieldSubmitted,
//           validator: validator,
//           textAlignVertical: TextAlignVertical.center,
//           obscureText: obscureText,
//           maxLines: maxLines,
//           minLines: minLines,
//           inputFormatters: formatter ?? [],
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: sizes.mediumPadding,
//               vertical: sizes.pagePadding,
//             ),
//             hintText: hint ?? "",
//             hintStyle: TextStyle(
//               color: AppColors.textFieldPlaceHolderText.withOpacity(
//                 0.5,
//               ),
//               fontFamily: Assets.poppinsMedium,
//               fontSize: sizes.fontRatio * 12,
//             ),
//             border: InputBorder.none,
//             prefixIcon: ValidationUtils.isValid(prefixIcon)
//                 ? Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: sizes.widthRatio * prefixPaddingHorizontal,
//                       vertical: sizes.heightRatio * prefixPaddingVertical,
//                     ),
//                     child: prefixIcon,
//                   )
//                 : null,
//             suffixIcon: ValidationUtils.isValid(suffixIcon)
//                 ? Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: sizes.widthRatio * suffixPaddingHorizontal,
//                       vertical: sizes.heightRatio * suffixPaddingVertical,
//                     ),
//                     child: GestureDetector(
//                       onTap: suffixOnTap,
//                       child: suffixIcon,
//                     ),
//                   )
//                 : null,
//           ),
//         ),
//       ),
//     );
//   }
// }
