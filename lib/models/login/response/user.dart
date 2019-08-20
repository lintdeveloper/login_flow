class User {
  final String message;
  final String name;
  final String contactMobile;
  final String contactEmail;
  final String accessToken;

  User({this.message, this.name, this.contactMobile, this.contactEmail, this.accessToken});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      message: json['message'],
      name: json["data"]["data"]['name'],
      contactMobile: json['data']['data']['contactmobile'],
      contactEmail: json['data']['data']['contactemail'],
      accessToken: json["data"]['tokendata']['access_token']
    );
  }
}