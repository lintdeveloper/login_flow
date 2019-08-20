import 'package:login_flow/models/reset_password/reset_password.dart';
import 'package:login_flow/models/signup/signup.dart';
import 'package:login_flow/models/user.dart';
import 'package:login_flow/utils/custom_exception.dart';
import 'package:login_flow/utils/utils.dart';

class SwipeDataSource {
  NetworkUtil _netUtil = new NetworkUtil();

  String swipeDataSourceUrl = BASE_URL + '/entrance';

  /// SignIn User
  Future<User> signIn({
    Map requestPayload,
  }) async {
    var url = swipeDataSourceUrl + '/signin';
    var headers = {"Accept": "application/json", "Content-Type": "application/json"};
    String msg;

    try {
      final responsePayload =  await _netUtil.post(url, headers: headers, body: requestPayload);

      return User.fromJson(responsePayload);
    } on CustomException catch (e) {
      msg=e.msg == null? SIGN_IN_ERROR_MSG: e.msg;
    } catch (e) {
      msg=e.toString();
    }
    throw CustomException(msg: msg);
  }

  /// User Resets Password
  Future<PasswordResetResponse> resetPassword({
    Map requestPayload,
  }) async {
    print("${requestPayload['email']}");
    var email = requestPayload['email'];
    var url = swipeDataSourceUrl + '/password/reset?email= $email';
    var headers = {"Accept": "application/json", "Content-Type": "application/json"};
    String msg;

    try {
      final responsePayload =  await _netUtil.post(url, headers: headers, body: requestPayload);

      return PasswordResetResponse.fromJson(responsePayload);
    } on CustomException catch (e) {
      msg=e.msg == null? FORGOT_PASSWORD_ERROR_MSG: e.msg;
    } catch (e) {
      msg=e.toString();
    }
    throw CustomException(msg: msg);
  }

  /// User sign Up
  Future<SignUpResponse> signUp({
    Map requestPayload,
  }) async {
    var url = swipeDataSourceUrl + '/signup';
    var headers = {"Accept": "application/json", "Content-Type": "application/json"};
    String msg;

    try {
      final responsePayload =  await _netUtil.post(url, headers: headers, body: requestPayload);
      return SignUpResponse.fromJson(responsePayload);
    } on CustomException catch (e) {
      msg=e.msg == null? SIGN_UP_ERROR_MSG: e.msg;
    } catch (e) {
      msg=e.toString();
    }
    throw CustomException(msg: msg);
  }

}