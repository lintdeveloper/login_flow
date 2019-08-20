class ResetPasswordRequest {
  final String userEmail;

  ResetPasswordRequest({this.userEmail});

  Map<String, dynamic> toJson() => { "username": userEmail};
}
