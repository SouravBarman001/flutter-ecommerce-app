class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );

  static final RegExp _nameRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+$',
  );

  static String? isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter email';
    } else {
      if (!_emailRegExp.hasMatch(email)) {
        return 'Please enter valid email';
      } else {
        return null;
      }
    }
  }

  static String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter password';
    } else {
      if (!_passwordRegExp.hasMatch(password)) {
        return 'Please enter valid password';
      } else {
        return null;
      }
    }
  }

  static String? isValidName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter name';
    } else {
      if (!_nameRegExp.hasMatch(name)) {
        return 'Please enter valid name';
      } else {
        return null;
      }
    }
  }
}
