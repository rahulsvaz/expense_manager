String? ageValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter correct age';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please Enter a valid name,';
  }
  return null;
}

String? batchValidator(String? value) {
  if (value == null || value.isEmpty) {
    return ('Please enter a valid batch');
  }
  return null;
}

String? placeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter correct details';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a phone number';
  }

  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    return 'Please enter a valid 10-digit phone number';
  }
  return null;
}

String? emailValidator(String? value) {
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
    return 'Please enter a valid email';
  }
  return null;
}
