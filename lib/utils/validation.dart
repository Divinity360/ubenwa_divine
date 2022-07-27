class AppValidation {
  static const String emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  static const String passwordPattern =
      r'^(?=.*?[a-zA-Z0-9])(?=.*?[,])(?=.*?[.]).{3,40}$';

  static String? validateEmptyField(String? value) {
    if (value == null || value.isEmpty) {
      return "This field shouldn't be empty";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    RegExp regex = RegExp(emailPattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    RegExp regex = RegExp(passwordPattern);

    if (value!.isEmpty || !regex.hasMatch(value)) {
      return 'Enter valid password';
    }
    return null;
  }
}
