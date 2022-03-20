// import 'dart:async' show Future;
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:nourri_user/models/user/user_data.dart';
// import 'package:nourri_user/res/strings.dart';
// import 'package:nourri_user/utils/validation/validation_utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class PreferenceUtils {
//   static String? userId;
//   static String? userName;
//   static String? password;
//   static String? userToken;
//   static String? vehicleId;
//   static String? firstName;
//   static String? lastName;
//   static String? phone;
//   static String? userImage;
//   static String? vehicleImage;
//   static bool? isOnline;
//   var time = DateTime;
//
//   static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
//   static SharedPreferences? _prefsInstance;
//
//   static Future<SharedPreferences> init() async {
//     _prefsInstance = await _instance;
//     return _prefsInstance!;
//   }
//
//   static String? getString(String? key, [String? defValue]) {
//     if (PreferenceUtils._prefsInstance != null) return _prefsInstance!.getString(key!) ?? defValue ?? "";
//   }
//
//   static Future<bool> setString(String key, String value) async {
//     var prefs = await _instance;
//
//     return prefs.setString(key, value);
//   }
//
//   static Future<bool> setBool(String key, bool value) async {
//     var prefs = await _instance;
//     return prefs.setBool(key, value);
//   }
//
//   static bool? getBool(String key, [bool? defValue]) {
//     return _prefsInstance!.getBool(key) ?? defValue ?? false;
//   }
//
//   static Future<bool> setInt(String key, int value) async {
//     var prefs = await _instance;
//
//     return prefs.setInt(key, value);
//   }
//
//   static int getInt(String key, [int? defValue]) {
//     return _prefsInstance!.getInt(key) ?? defValue ?? 0;
//   }
//
//   static clearPreferences() {
//     _prefsInstance!.clear();
//   }
//
//   static Future<bool> setDouble(String key, double value) async {
//     var prefs = await _instance;
//     return prefs.setDouble(key, value);
//   }
//
//   static double getDouble(String key, [double? defValue]) {
//     return _prefsInstance!.getDouble(key) ?? defValue ?? 0;
//   }
//
//   static Future<void> saveData({@required Map<String, dynamic>? data}) async {
//     data!.forEach((key, value) async {
//       switch (value.runtimeType) {
//         case String:
//           await PreferenceUtils.setString(key, value);
//           return;
//         case int:
//           await PreferenceUtils.setInt(key, value);
//           return;
//         case bool:
//           await PreferenceUtils.setBool(key, value);
//           return;
//       }
//     });
//   }
//
//   static String getUserName() {
//     userName = PreferenceUtils.getString(Strings.loginName);
//     return userName ?? "";
//   }
//
//   static setUserName({required String name}) async {
//     PreferenceUtils.setString(Strings.loginName, name);
//   }
//
//   static String getPassword() {
//     password = PreferenceUtils.getString(Strings.loginPassword);
//     return password ?? "";
//   }
//
//   static setPassword({required String password}) async {
//     PreferenceUtils.setString(Strings.loginPassword, password);
//   }
//
//   static String getUserToken() {
//     userToken = PreferenceUtils.getString(Strings.loginUserToken);
//     return userToken ?? "";
//   }
//
//   static setUserToken({required String userToken}) async {
//     PreferenceUtils.setString(Strings.loginUserToken, userToken);
//   }
//
//   static String getUserId() {
//     userId = PreferenceUtils.getString(Strings.loginUserId);
//     return userId ?? "";
//   }
//
//   static setUserId(String name) async {
//     PreferenceUtils.setString(Strings.loginUserId, name);
//   }
//
//   static String getPhone() {
//     phone = PreferenceUtils.getString(Strings.loginPhoneNo);
//     return phone ?? "";
//   }
//
//   static setPhone(String name) async {
//     PreferenceUtils.setString(Strings.loginPhoneNo, name);
//   }
//
//   static String getUserImage() {
//     userImage = PreferenceUtils.getString(Strings.userImageKey);
//     return userImage ?? "";
//   }
//
//   static setUserImage(String name) async {
//     PreferenceUtils.setString(Strings.userImageKey, name);
//   }
//
//   static setUserData({required UserData userData}) {
//     print('set user data: ${userData.toJson()}');
//     String userDataString = jsonEncode(userData);
//     PreferenceUtils.setString(Strings.userData, userDataString);
//   }
//
//   static UserData getUserData() {
//     Map<String, dynamic>? userDataMap;
//     UserData data = UserData();
//     if (ValidationUtils.isValid(PreferenceUtils.getString(Strings.userData))) {
//       userDataMap = jsonDecode(PreferenceUtils.getString(Strings.userData)!);
//       data = UserData.fromJson(userDataMap);
//       // return UserData.fromJson(userDataMap);
//     }
//     return data;
//   }
//
//   static removeUserData() {
//     _prefsInstance!.remove(Strings.userData);
//   }
// }
