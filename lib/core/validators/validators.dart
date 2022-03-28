class Validators {
  static String? email(String? value) {
    if (value!.isEmpty) {
      return 'Email can\'t be empty';
    }

    return null;
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return 'Password can\'t be empty';
    } else if (value.length < 8) {
      return 'Password should be greater then 8 chars';
    }

    return null;
  }
}
