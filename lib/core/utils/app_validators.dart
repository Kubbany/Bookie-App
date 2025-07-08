class AppValidators {
  // required field
  static String? requiredField(String? value, {bool ignoreValidation = false}) {
    if (ignoreValidation) {
      return null;
    } else if (value == null || value.isEmpty) {
      return "This Field Cannot Be Empty";
    }
    return null;
  }

  static String? emailValidation(String? value, {bool ignoreValidation = false}) {
    if (ignoreValidation) {
      return null;
    } else if (value == null || value.isEmpty) {
      return "This Field Cannot Be Empty";
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (ignoreValidation) {
      return null;
    } else if (!emailRegex.hasMatch(value)) {
      return "Please Enter A Valid Email";
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field Cannot Be Empty";
    }
    if (value.length < 8) {
      return "Password Must Be At Least 8 Chars";
    }
    return null;
  }

  static String? confirmPasswordValiation(String? value, String passwordValue) {
    if (value == null || value.isEmpty) {
      return "This Field Cannot Be Empty";
    }
    if (value != passwordValue) {
      return "Password Doesn't Match";
    }
    return null;
  }
}
