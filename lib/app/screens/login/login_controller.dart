import 'package:get/get.dart';

import 'package:ramp_up/constants.dart';

class LoginController extends GetxController {
  final infos = [
    {
      'info': kInvalidEmailError,
      'status': false,
    },
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
    var info = infos[0];
    info = {
      'info': infos[0]['info'] as String,
      'status': emailValidatorRegExp.hasMatch(email!) ? true : false,
    };

    infos[0] = info;
    infos.refresh();
  }

  //* Check password validation
  void passwordValidation({String? password}) {
    checkPasswordLength(password!);
    checkDigit(password);
    checkSpecialCharacter(password);
    checkUppercase(password);

    infos.refresh();
  }

  //* check if password contains atleast one uppercase
  void checkUppercase(String password) {
    var info = infos[4];
    info = {
      'info': infos[4]['info'] as String,
      'status': upperCaseValidatorRegExp.hasMatch(password) ? true : false,
    };
    infos[4] = info;
  }

  //* check if password contains atleast one special character
  void checkSpecialCharacter(String password) {
    var info = infos[3];
    info = {
      'info': infos[3]['info'] as String,
      'status': password.isEmpty
          ? false
          : (specialCharValidatorRegExp.hasMatch(password) ? true : false),
    };
    infos[3] = info;
  }

  //* check if password contains atleast 1 Numeric digit
  void checkDigit(String password) {
    var info = infos[2];
    info = {
      'info': infos[2]['info'] as String,
      'status': digitValidatorRegExp.hasMatch(password) ? true : false,
    };
    infos[2] = info;
  }

  //* check if password length greater than 6
  void checkPasswordLength(String password) {
    var info = infos[1];
    info = {
      'info': infos[1]['info'] as String,
      'status': password.length >= 6 ? true : false,
    };
    infos[1] = info;
  }
}
