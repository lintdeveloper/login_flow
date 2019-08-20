import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_flow/models/login/request/sign_in_request.dart';
import 'package:login_flow/models/reset_password/reset_password.dart';
import 'package:login_flow/models/signup/signup.dart';
import 'package:login_flow/models/user.dart';
import 'package:login_flow/services/data/rest_ds.dart';

class UserRepository {

  final storage = new FlutterSecureStorage();
  String _accessToken;
  String accessToken = "accessToken";

  Future<String> authenticate({
    @required String email,
    @required String password
  }) async {

    User result = await SwipeDataSource().signIn(
      requestPayload: SignInRequest(password: password, useremail: email).toJson()
    );
    _accessToken = result.accessToken;
    await storage.write(key: accessToken, value: _accessToken);

    return _accessToken;
  }

  Future<String> register({
    @required String email,
    @required String mobile,
    @required String gender,
    @required String name,
    @required String password,
    @required String referral
  }) async {

    SignUpResponse result = await SwipeDataSource().signUp(
        requestPayload: SignUpRequest(contactEmail: email, contactMobile: mobile, gender: gender, name: name, password: password, referral: referral ).toJson()
    );
    return result.message;
  }

  Future<String> resetPassword({
    @required String email,
  }) async {

    PasswordResetResponse result = await SwipeDataSource().resetPassword(
        requestPayload: ResetPasswordRequest(userEmail: email).toJson()
    );
    return result.message;
  }


  Future<void> deleteToken() async {
    await storage.delete(key: accessToken);
    return;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: accessToken, value: token);
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    String value = await storage.read(key: accessToken);
    if(value == null) {
      return false;
    }
    return true;
  }
}
