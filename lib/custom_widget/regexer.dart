Pattern _mobilePattern = r'^[6-9]{1}\d{9}$';
Pattern _emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

Pattern _passwordPattern =
    r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';

RegExp mobileRegex = RegExp(_mobilePattern.toString());
RegExp passwordRegex = RegExp(_passwordPattern.toString());
RegExp emailRegex = RegExp(_emailPattern.toString());