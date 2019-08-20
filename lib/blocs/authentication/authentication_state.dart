import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class UnauthenticatedResetPassword extends AuthenticationState{
  @override
  String toString() => 'AuthenticationResetPassword';
}

class UnauthenticatedForgotPasswordInitial extends AuthenticationState {
  @override
  String toString() => 'UnauthenticatedForgotPassword';
}

class UnauthenticatedSignUpUserInitial extends AuthenticationState {
  @override
  String toString() => 'UnauthenticatedSignUpUserInitial';
}

class AuthenticatedLetsGo extends AuthenticationState {
  @override
  String toString() => 'AuthenticatedLetsGo';
}

class AuthenticatedSetProfilePicture extends AuthenticationState {
  @override
  String toString() => 'AuthenticatedSetProfilePicture';
}

class AuthenticationTransactionPin extends AuthenticationState {
  @override
  String toString() => 'AuthenticationTransactionPin';
}

