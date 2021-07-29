import 'package:get/get.dart';

import 'package:ramp_up/constants.dart';

class LoginController extends GetxController {
  var emailErrorText = ''.obs;
  var passwordErrorText = ''.obs;

  final infos = [
    {
      'info': kShortPassError,
      'status': false,
    },
    {
      'info': kOneDigitInPassword,
      'status': false,
    },
    {
      'info': kspecialCharInPassword,
      'status': false,
    },
    {
      'info': kUpperCaseInPassword,
      'status': false,
    },
  ].obs;

  //* Check email validation
  void emailValidation({String? email}) {
    if (email!.isEmpty) {
      emailErrorText.value = kEmailNullError;
    } else if (!emailValidatorRegExp.hasMatch(email)) {
      emailErrorText.value = kInvalidEmailError;
    } else {
      emailErrorText.value = '';
    }
  }

  //* Check password validation
  void passwordValidation({String? password}) {
    passwordErrorText.value = '';
    if (password!.isNotEmpty) {
      checkPasswordLength(password);
      checkDigit(password);
      checkSpecialCharacter(password);
      checkUppercase(password);
    } else {
      passwordErrorText.value = '';
    }

    infos.refresh();
  }

  //* check if password contains atleast one uppercase
  void checkUppercase(String password) {
    var info = infos[3];
    if (upperCaseValidatorRegExp.hasMatch(password)) {
      info['status'] = true;
    } else {
      info['status'] = false;
      passwordErrorText.value = ' ';
    }
    infos[3] = info;
  }

  //* check if password contains atleast one special character
  void checkSpecialCharacter(String password) {
    var info = infos[2];
    if (specialCharValidatorRegExp.hasMatch(password)) {
      info['status'] = true;
    } else {
      info['status'] = false;
      passwordErrorText.value = ' ';
    }
    infos[2] = info;
  }

  //* check if password contains atleast 1 Numeric digit
  void checkDigit(String password) {
    var info = infos[1];
    if (digitValidatorRegExp.hasMatch(password)) {
      info['status'] = true;
    } else {
      info['status'] = false;
      passwordErrorText.value = ' ';
    }
    infos[1] = info;
  }

  //* check if password length greater than 6
  void checkPasswordLength(String password) {
    var info = infos[0];
    if (password.length >= 6) {
      info['status'] = true;
    } else {
      info['status'] = false;
      passwordErrorText.value = ' ';
    }
    infos[0] = info;
  }
}
