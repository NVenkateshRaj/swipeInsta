

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';



class PreferenceService {
  static const String bearerToken = "BEARERTOKEN";
  static const String userName = "USERNAME";
  static const String shopName = "SHOPNAME";
  static const String is_authed = "ISAUTHED";
  static const String appVersion = "APPVERSION";
  static const String delivery_location = "DELIVERY_LOCATION";
  static const String recent_search_location = "RECENT_SEARCH_LOCATION";
  static const String recent_search = "RECENT_SEARCH";
  static const String cart = "CART";
  static const String user = "USER";
  static const String activeOrganisationId = "ACTIVE_ORGANISATION_ID";
  static const String backUpDate = "backUpDate";

  SharedPreferences pref;

  init() async {
    pref = await SharedPreferences.getInstance();
  }

  setBearerToken(String value) {
    pref.setString(bearerToken, value);
    debugPrint("Bearer Token stored successfully");
  }

  setUserName(String value) async {
    pref.setString(userName, value);
    debugPrint("Name  stored successfully");
  }

  setShopName(String value) async {
    pref.setString(userName, value);
    debugPrint("ShopName  stored successfully");
  }

  setActiveOrganisationId(int value) async {
    pref.setInt(activeOrganisationId, value);
    debugPrint("Active Organisation Id stored successfully");
  }


  setAuthenticated(bool value) async {
    pref.setBool(is_authed, value);
    debugPrint("Is Authed stored successfully");
  }

  setAppVersion(String value) async {
    pref.setString(appVersion, value);
    debugPrint("Is AppVersion stored successfully");
  }

  setbackUpDate(String value) async {
    pref.setString(backUpDate, value);
    debugPrint("Is BackUpDate stored successfully");
  }


  String getBearerToken() {
    return pref.getString(bearerToken) ?? "";
  }

  String getShopName() {
    return pref.getString(shopName) ?? "";
  }
  String getAppVersion() {
    return pref.getString(appVersion) ?? "";
  }

  String getName() {
    return pref.getString(userName) ?? "";
  }

  int getActiveOrganisationId() {
    return pref.getInt(activeOrganisationId) ?? 0;
  }

  bool isAuthenticated() {
    return pref.getBool(is_authed) ?? null;
  }

  String getBackUpDate(){
    return pref.getString(backUpDate) ?? "";
  }

  clearData() async {
    pref.clear();
  }

}
