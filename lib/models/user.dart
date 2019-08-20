import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String contactMobile;
  final String contactEmail;
  final String accessToken;

  User({this.username, this.contactMobile, this.contactEmail, this.accessToken}):
        super([username, contactMobile, contactEmail, accessToken]);


  static User fromJson(dynamic json){
    final data = json['data']['data'];
    final tokenData = json['data']['tokendata'];

    return User(
        username: data['name'],
        contactMobile: data['contactmobile'],
        contactEmail: data['contactemail'],
        accessToken: tokenData['access_token']
    );
  }
}
