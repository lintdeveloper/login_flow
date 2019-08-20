import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_flow/models/user.dart';
import 'package:login_flow/utils/custom_exception.dart';
import 'package:login_flow/utils/utils.dart';

class UserApiClient {
  static const baseUrl = "https://swipe.net.ng/api";
  NetworkUtil netUtil;

  UserApiClient({@required this.netUtil}): assert(netUtil != null);



  Future<String> signIn({Map requestPayload}) async {
    var url =  baseUrl + "/entrance/signin";
    var headers = {"Content-Type": "application/json"};

    String msg;
    try {
      final responsePayload =  await this.netUtil.post(url, headers: headers, body: requestPayload);
      return User.fromJson(responsePayload).accessToken;
    } on CustomException catch (e) {
      msg=e.msg == null? LOGIN_ERROR_MSG: e.msg;
    } catch (e) {
      msg=e.toString();
    }
    throw CustomException(msg: msg);

  }

//  UserApiClient({@required this.httpClient}): assert(httpClient != null);

//  Future<String> signIn(String email, String password) async {
//    final signInUrl = baseUrl + "/entrance/signin";
//    print(signInUrl);
//    final response = await this.httpClient.post(signInUrl, body: {"username" : email, "password": password} );
//
//    if(response.statusCode != 200) {
//      throw Exception('Error Sigining in as User');
//    }
//
//
//    final userJson = jsonDecode(response.body);
//    return User.fromJson(userJson).accessToken;
//  }
}