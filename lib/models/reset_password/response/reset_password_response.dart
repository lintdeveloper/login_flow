class PasswordResetResponse {
  final String message;

  PasswordResetResponse({this.message});

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json){
    return PasswordResetResponse(
      message: json['message']
    );
  }
}