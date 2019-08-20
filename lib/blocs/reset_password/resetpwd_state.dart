import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  ResetPasswordState([List props = const []]) : super(props);
}

class ResetPasswordInitial extends ResetPasswordState {
  @override
  String toString() => 'ResetPasswordInitial';
}

class ResetPasswordLoading extends ResetPasswordState {
  @override
  String toString() => 'ResetPasswordLoading';
}

class ResetPasswordFailure extends ResetPasswordState {
  final String error;

  ResetPasswordFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'ResetPasswordFailure { error: $error }';
}
