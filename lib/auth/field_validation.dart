class FieldValidation {
  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return ("Please Enter Email ");
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return ("please Enter Valid Email");
    }
    return null;
  }

  static String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter Password";
    }
    if (password.length < 6) {
      return "Password Incorrect";
    }
    return null;
  }
}
