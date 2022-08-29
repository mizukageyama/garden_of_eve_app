class Validator {
  Validator();

  String? email(String? value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  String? password(String? value) {
    const pattern = r'^.{6,}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Password must be at least 6 characters';
    } else {
      return null;
    }
  }

  String? number(String? value) {
    if (value == null) {
      return 'This is a required field';
    }
    const pattern = r'^[0-9]*$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a number';
    }
    return null;
  }

  String? notEmpty(String? value) {
    if (value == '') {
      return 'This is a required field';
    } else {
      return null;
    }
  }
}
