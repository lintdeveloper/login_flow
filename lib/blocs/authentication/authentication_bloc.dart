import 'dart:async';

import 'package:login_flow/services/services.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'authentication.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }

    if(event is LoggedInLetsGo){
      yield AuthenticatedLetsGo();
    }

    if(event is LoggedInTransPinSetNavToDashboard){
      yield AuthenticatedSetProfilePicture();
    }
    if(event is AppForgotPassword){
      yield UnauthenticatedResetPassword();
    }

    if(event is ToSignUpEvent){
      yield UnauthenticatedSignUpUserInitial();
    }

    if(event is ToForgotPasswordEvent){
      yield UnauthenticatedForgotPasswordInitial();
    }
//    ToSignUpEvent
//    ToForgotPasswordEvent

//    if(event is )
//    AuthenticationTransactionPin
  }
}
