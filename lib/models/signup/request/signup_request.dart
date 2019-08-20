class SignUpRequest {
  final String contactEmail;
  final String contactMobile;
  final String gender;
  final String name;
  final String password;
  final String referral;

  SignUpRequest(
      {this.contactEmail,
      this.contactMobile,
      this.gender,
      this.name,
      this.password,
      this.referral});

  Map<String, dynamic> toJson() => {
        "contactemail": contactEmail,
        "contactmobile": contactMobile,
        "gender": gender,
        "name": name,
        "password": password,
        "referral": referral
      };
}
