// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:taskdone/data/helpers/encription.dart';
import 'package:taskdone/data/helpers/session_controller.dart';
import 'package:taskdone/utilities/common/screens/no_internet_screen.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/colors.dart';

class BaseClientClass {
  static const int timeOutDuration = 60;
  static SessionController sessionController = SessionController.instance;

  static Future<dynamic> post(String url, data, {String? token}) async {
    bool isInternetConnected = await BaseClientClass.isInternetConnected();
    if (!isInternetConnected) {
      await Get.offAll(const NoInternetScreen());
      return;
    }
    token ??= sessionController.getToken();
    var normalData = data;
    var requestedBody = await encriptdata(data);
    data = {"requestBody": requestedBody};

    if (kDebugMode) {
      print('Url :::: => $url');
      print('Encripted Data :::: => $data');
      print('Token :::: => $token');
    }

    http.Response response;
    try {
      response = await http
          .post(
            Uri.parse(url),
            body: json.encode(data),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $token',
              'ApiKey': ''
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: timeOutDuration));

      if (kDebugMode) {
        print('response :::: => ${response.statusCode}');
      }
      return _getResponse(response, url, normalData);
    } on SocketException {
      if (kDebugMode) {
        print(
            'Response :::: => SocketException :::: => No internet connection');
      }
      await Get.to(() => const NoInternetScreen());
      return 'No internet connection';
    } on TimeoutException {
      getx.Get.snackbar(
        AppLabels.error,
        AppLabels.connectionTimedOut,
        backgroundColor: AppColors.purple,
      );
      return AppLabels.connectionTimedOut;
    } catch (e) {
      if (kDebugMode) {
        print('catch :::: => $e');
      }
      return AppLabels.anyError;
    }
  }

  static Future<dynamic> postwithheader(String url, data,
      {String? token}) async {
    bool isInternetConnected = await BaseClientClass.isInternetConnected();
    if (!isInternetConnected) {
      await Get.offAll(const NoInternetScreen());
      return;
    }
    token ??= sessionController.getToken();
    var normalData = data;
    var requestedBody = await encriptdata(data);
    data = {"requestBody": requestedBody};

    if (kDebugMode) {
      print('Url :::: => $url');
      print('Encripted Data :::: => $data');
      print('Token :::: => $token');
    }

    http.Response response;
    try {
      response = await http
          .post(
            Uri.parse(url),
            body: json.encode(data),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $token',
              'ApiKey': '',
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      if (kDebugMode) {
        print('Request: ${response.request}');
        // print('Headers: ${response.request.headers}');
        print('End: $url');
      }
      if (kDebugMode) {
        print('response:: ${response.statusCode}');
      }
      return _getResponse(response, url, normalData);
    } on SocketException {
      if (kDebugMode) {
        print(
            'Response :::: => SocketException :::: => No internet connection');
      }
      await Get.to(() => const NoInternetScreen());
      return 'No internet connection';
    } on TimeoutException {
      getx.Get.snackbar(
        AppLabels.error,
        AppLabels.connectionTimedOut,
        backgroundColor: AppColors.purple,
      );
      return AppLabels.connectionTimedOut;
    } catch (e) {
      if (kDebugMode) {
        print('catch :::: => $e');
      }
      return AppLabels.anyError;
    }
  }

/////////
  static Future<dynamic> postwithheaderwithouttoken(
    String url,
    data,
  ) async {
    bool isInternetConnected = await BaseClientClass.isInternetConnected();
    if (!isInternetConnected) {
      await Get.offAll(const NoInternetScreen());
      return;
    }
    var normalData = data;
    var requestedBody = await encriptdata(data);
    data = {"requestBody": requestedBody};

    if (kDebugMode) {
      print('Url :::: => $url');
      print('Encripted Data :::: => $data');
    }

    http.Response response;
    try {
      response = await http
          .post(
            Uri.parse(url),
            body: json.encode(data),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer ',
              'ApiKey': 'UZ5QdWg2dLm1sop09082AccIa03DxupsIWDt9rqfeM',
              "raw": "datawithoutfile"
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: timeOutDuration));

      if (kDebugMode) print('Request: ${response.request}');
      // print('Headers: ${response.request.headers}');
      if (kDebugMode) print('End: $url');

      if (kDebugMode) print('response:: ${response.statusCode}');
      return _getResponse(response, url, normalData);
    } on SocketException {
      if (kDebugMode) {
        print(
            'Response :::: => SocketException :::: => No internet connection');
      }
      await Get.to(() => const NoInternetScreen());
      return 'No internet connection';
    } on TimeoutException {
      getx.Get.snackbar(
        AppLabels.error,
        AppLabels.connectionTimedOut,
        backgroundColor: AppColors.purple,
      );
      return AppLabels.connectionTimedOut;
    } catch (e) {
      if (kDebugMode) {
        print('catch :::: => $e');
      }
      return AppLabels.anyError;
    }
  }

  static Future<dynamic> uploadFile(
      String url, Map<String, String> fields, String fileField, String filePath,
      {String? token}) async {
    bool isInternetConnected = await BaseClientClass.isInternetConnected();
    if (!isInternetConnected) {
      await Get.offAll(const NoInternetScreen());
      return;
    }
    String bearerToken = token ?? SessionController.instance.getToken() ?? '';
    try {
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(url));

      if (filePath != '') {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath(fileField, filePath);
        request.files.add(multipartFile);
      }

      request.fields.addAll(fields);
      request.headers.addAll({
        "Content-Type": "application/json",
        'Authorization': 'Bearer $bearerToken',
      });

      http.StreamedResponse response = await request.send();
      var res = await http.Response.fromStream(response);
      if (kDebugMode) {
        print('Response ::::=> ${res.body}');
      }

      if (response.statusCode == 404) {
        final respStr = await response.stream.bytesToString();
        if (response.statusCode == 404 && respStr.contains('HTML') == true ||
            respStr.contains(
                    '!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN') ==
                true) {
          if (kDebugMode) {
            print('Response ::::=> $respStr');
          }
        }
      }
      // response.statusCode == 401 putting this condition because
      // in multipart we are not calling _getResponse for handle the response
      if (response.statusCode == 401) {
        getx.Get.snackbar(
          AppLabels.error,
          AppLabels.unauthorized,
          backgroundColor: AppColors.purple,
        );
        return AppLabels.unauthorized;
      }
      // Response of UploadFile
      // The below lines for print the response of uploadFile
      // var res = await http.Response.fromStream(response);
      // print('Respone :11::22:: ${res.body}');
      return response;
    } catch (e) {
     if (kDebugMode) {
        print('catch :::: => $e');
      }

      return 0;
    }
  }

  static Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static dynamic _getResponse(
      http.Response response, String url, dynamic data) async {
    if (kDebugMode) {
      print(
          'Response Body ::::=> Url :: $url Data :: $data Response :: ${response.body}');
    }
    if (response.statusCode == 404) {
      if (response.statusCode == 404 &&
              response.body.contains('HTML') == true ||
          response.body.contains(
                  '!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN') ==
              true) {
       
      }
    }
    if (response.statusCode == 503) {
      if (response.statusCode == 503 &&
              response.body.contains('HTML') == true ||
          response.body.contains(
                  '!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN') ==
              true) {
       
      }
    }
    
    if (response.body.contains('BadRequestExecution Timeout Expired')) {
      return AppLabels.connectionTimedOut;
    }

    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        return AppLabels.badRequest;
      case 401:
        getx.Get.snackbar(
          AppLabels.error,
          AppLabels.unauthorized,
          backgroundColor: AppColors.purple,
        );
        return AppLabels.unauthorized;
      case 403:
        getx.Get.snackbar(
          AppLabels.error,
          AppLabels.unauthorized,
          backgroundColor: AppColors.purple,
        );
        return AppLabels.unauthorized;
      case 404:
        return AppLabels.noDatafound;
      case 500:
        return AppLabels.anyError;
      case 501:
        if (kDebugMode) {
          print(response.body);
        }
        getx.Get.snackbar(
          AppLabels.error,
          AppLabels.processingError,
          backgroundColor: AppColors.purple,
        );
        return AppLabels.noDatafound;

      default:
        getx.Get.snackbar(
          AppLabels.error,
          AppLabels.couldNotConnectToServer,
          backgroundColor: AppColors.purple,
        );
        return AppLabels.couldNotConnectToServer;
    }
  }
}
