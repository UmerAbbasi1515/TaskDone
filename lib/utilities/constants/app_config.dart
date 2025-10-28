import 'package:flutter/foundation.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._internel();

  String? baseUrl;

  String? getData;
  factory AppConfig() {
    return _instance;
  }

  AppConfig._internel() {
    setUrls();
  }

  void setUrls() {
    if (kReleaseMode) baseUrl = "https://cccc.cc.cc.ccc.com";

    getData = '${baseUrl!}Terreenant/cccc/ssddd';
  }
}
