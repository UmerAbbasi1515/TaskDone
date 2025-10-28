// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskdone/data/helpers/base_client.dart';
import 'package:taskdone/utilities/constants/app_config.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';

class GetDataService {
 
  static Future<dynamic> getData() async {
    final String url = AppConfig().getData??"";
    Map data = {"testId": ""};
    var response = await BaseClientClass.post(url, data);
    if (response is http.Response) {
      try {
        var resp = json.decode(response.body);
        String byteString = resp["bytes"];
        return base64Decode(byteString.replaceAll('\n', ''));
      } catch (_) {
        return AppLabels().test;
      }
    }
    return response;
  }
}
