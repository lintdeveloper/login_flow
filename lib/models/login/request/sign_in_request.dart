class SignInRequest {
  final String password;
  final String useremail;

  SignInRequest({this.password, this.useremail});

  Map<String, dynamic> toJson() => {"password": password, "username": useremail};
}
