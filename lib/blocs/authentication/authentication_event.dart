import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class ToSignUpEvent extends AuthenticationEvent {
  @override
  String toString() => 'ToSignUpEvent';
}

class ToForgotPasswordEvent extends AuthenticationEvent {
  @override
  String toString() => 'ToForgotPasswordEvent';
}

// TODO: Assign purpose later
class SignedUp extends AuthenticationEvent {
  final String message;

  SignedUp({@required this.message}) : super([message]);

  @override
  String toString() => 'SignedUp { : $message }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}

class LoggedInLetsGo extends AuthenticationEvent{
  @override
  String toString() => 'LoggedInLetsGo';
}

class LoggedInUploadSelfie extends AuthenticationEvent{
  @override
  String toString() => 'LoggedInUploadSelfie';
}

class LoggedInSelfieUploadedToTransactionPin extends AuthenticationEvent{
  @override
  String toString() => 'SelfieUploadedToTransactionPin';
}

class LoggedInSetTrancPin extends AuthenticationEvent {
  @override
  String toString() => 'LoggedInSetTrancPin';
}

class LoggedInTransPinSetNavToDashboard extends AuthenticationEvent {
  @override
  String toString() => 'LoggedInTransPinSetNavToDashboard';
}


class AppForgotPassword extends AuthenticationEvent {

  @override
  String toString() => 'App Forgot Password';
}
