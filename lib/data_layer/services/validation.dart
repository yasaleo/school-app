import 'dart:developer';

class Validation {
  String? email(String? value) {
    log(value!);
    if (value.isEmpty) {
      return 'please enter a your email 🤦';
    }

    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return "Please enter a valid email 🙆";
    }
    return null;
  }

  String? password(String? value) {
    if (value!.isEmpty) {
      return 'please enter a your password 🤦';
    }
    if (value.length < 6) {
      return "password should contain atleast 6 letters 💪";
    }

    return null;
  }
}
