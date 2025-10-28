import 'dart:convert';
import 'dart:core';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

encriptdata(payload) {
  String jsonUser = jsonEncode(payload);
  final key = Key.fromUtf8(dotenv.env['Key'] ?? "");
  String strIv = dotenv.env['strIv'] ?? "";
  var iv = IV.fromUtf8(utf8.decode((strIv).codeUnits));
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
  final encrypted = encrypter.encrypt(
    jsonUser,
    iv: iv,
  );

  return encrypted.base64;
}

encriptdatasingle(payload) {
  final key = Key.fromUtf8(dotenv.env['Key'] ?? "");
  String strIv = dotenv.env['strIv'] ?? "";
  var iv = IV.fromUtf8(utf8.decode((strIv).codeUnits));
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
  final encrypted = encrypter.encrypt(
    payload,
    iv: iv,
  );
  return encrypted.base64;
}
