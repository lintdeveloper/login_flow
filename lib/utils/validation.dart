class Validation {
  static Validation _instance = new Validation.internal();
  Validation.internal();
  factory Validation() => _instance;

  String validateEmail(String email, [String confirmEmail]) {

    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (confirmEmail == null) {
      if (email.isEmpty) {
        // The form is empty
        return "Value Can\'t Be Empty";
      }

      if (regExp.hasMatch(email) && email.contains("@")) {
        // So, the email is valid
        return null;
      }
      return "The email is invalid";
    } else {
      if (email.isEmpty || !regExp.hasMatch(email) || !email.contains("@")) {
        // So, the email is valid
        return "please enter a valid email";
      }

      return null;
    }
  }

  String validateFullName(String name) {
    if (name.isEmpty) {

      return "Please enter your name";
    }
    return null;
  }

  String validatePassword(String password) {
    if (password.length < 6) {
      return "Please create a password containing at least 6 characters";
    }
    return null;
  }

  bool isValidPhoneNumber(String phoneNumber) {

    RegExp _numeric = new RegExp(r'^-?[0-9]+$');
    return phoneNumber.length == 13 && _numeric.hasMatch(phoneNumber);
  }

  bool isEmail(String str) {
    return str.contains("@");
  }

  String removeWhiteSpaces(String str) {
    return str.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
  }

  String validatePin(String pin) {
    if (pin.isEmpty) {
      return 'Field cannot be empty';
    }

    if (pin.length < 4) {
      return 'Enter 4 characters';
    }
    return null;
  }

  bool isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}