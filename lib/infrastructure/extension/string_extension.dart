extension StringX on String {
  // bool get isEmail {
  //   return RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(this);
  // }

  bool get isEmail {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(this);
  }

  bool get isStrongPass {
    return RegExp(
      r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d#?!@$%^&*-].{0,}$',
    ).hasMatch(this);
  }

  bool get hasMinPasswordLength => length >= 8;

  bool get hasPasswordLetterAndNumber {
    return RegExp('[A-Za-z]').hasMatch(this) && RegExp(r'\d').hasMatch(this);
  }

  bool get isValidRegisterPassword {
    return hasMinPasswordLength && hasPasswordLetterAndNumber;
  }

  String toUpperFirstChar() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String toUpperFirstCharEachWord() {
    return split(' ').map((e) => e.toUpperFirstChar()).join(' ');
  }

  String toAbbreviation() {
    return split(' ').map((e) => e[0]).join().toUpperCase();
  }
}
