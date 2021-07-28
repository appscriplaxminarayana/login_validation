final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final RegExp specialCharValidatorRegExp =
    RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
final RegExp digitValidatorRegExp = RegExp(r'\d');
final RegExp upperCaseValidatorRegExp = RegExp(r'(?=.*[a-z])(?=.*[A-Z])\w+');

const String kEmailNullError = 'Please Enter your email';
const String kInvalidEmailError = 'Please enter valid email';

const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'length should be more than 6';

const String kOneDigitInPassword = 'should contain atleast 1 digit';
const String kspecialCharInPassword =
    'should contain atleast 1 special character';
const String kUpperCaseInPassword = 'should contain atleast 1 uppercase';

const password = 'Appscrip@12345';

const defaultPadding = 16.0;
