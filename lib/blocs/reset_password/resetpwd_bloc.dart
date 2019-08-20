import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_flow/blocs/authentication/authentication.dart';
import 'package:login_flow/services/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'resetpwd.dart';
import 'resetpwd_event.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;



  ResetPasswordBloc({Key key,
    @required this.userRepository,
    @required this.authenticationBloc
  }):assert(authenticationBloc != null);

//        assert(authenticationBloc != null);

  @override
  ResetPasswordState get initialState => ResetPasswordInitial();

  @override
  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {
    if (event is ResetPasswordButtonPressed) {
      yield ResetPasswordLoading();

      try {
        final message = await userRepository.resetPassword(
          email: event.email
        );
        print("Success Message: $message");
//        authenticationBloc.dispatch(AppForgotPassword(message: message));
        yield ResetPasswordInitial();
      } catch (error) {
        yield ResetPasswordFailure(error: error.toString());
      }
    }
  }
}
