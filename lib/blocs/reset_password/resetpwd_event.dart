import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  ResetPasswordEvent([List props = const []]) : super(props);
}

class ResetPasswordButtonPressed extends ResetPasswordEvent {
  final String email;

  ResetPasswordButtonPressed({
    @required this.email,
  }) : super([email]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $email }';
}
