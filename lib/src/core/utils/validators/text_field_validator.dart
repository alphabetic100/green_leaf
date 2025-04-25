class TextFieldValidator {
  static String? validateField(String? value) {
    if (value == null) {
      return 'This field is required';
    }
    if (value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null) {
      return 'Email is required';
    }
    if (value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null) {
      return 'Phone number is required';
    }
    if (value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^\+?\d{10,14}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}
