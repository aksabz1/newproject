import 'package:flutter/material.dart';

abstract class Validation<T> {
  const Validation();
  String? validate(BuildContext context, T? value);
}

class RequiredValidation<T> extends Validation<T> {
  @override
  String? validate(BuildContext context, value) {
    if (value == null) {
      return 'این فیلد نمی‌تواند خالی باشد';
    }
    if (value is String && (value as String).isEmpty) {
      return 'این فیلد نمی‌تواند خالی باشد';
    }
    return null;
  }
}

class MinLengthValidation<T> extends Validation<T> {
  @override
  String? validate(BuildContext context, T? value) {
    if ((value as String).length < 3) {
      return 'این فیلد خیلی کوتاه است';
    }
    return null;
  }
}

class NationalIdValidation extends Validation<String> {
  @override
  String? validate(BuildContext context, value) {
    if (value == null) {
      return 'این فیلد نمی‌تواند خالی باشد';
    }
    if (value.length != 10) {
      return 'کد ملی باید ۱۰ رقم باشد';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'کد ملی باید فقط شامل اعداد باشد';
    }
    List<int> digits = value.split('').map((d) => int.parse(d)).toList();
    int checkDigit = digits.removeLast();

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += digits[i] * (10 - i);
    }
    int remainder = sum % 11;
    if ((remainder < 2 && checkDigit != remainder) ||
        (remainder >= 2 && checkDigit != 11 - remainder)) {
      return 'کد ملی نامعتبر می‌باشد';
    }

    return null;
  }
}

class PhoneNumberValidation extends Validation<String> {
  @override
  String? validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'شماره موبایل را وارد کنید';
    }
    if (!value.startsWith('09')) {
      return 'شماره موبایل باید با "09" شروع شود';
    }
    if (value.length != 11) {
      return 'شماره موبایل باید یازده رقم باشد';
    }

    return null;
  }
}

class Validator {
  Validator._();
  static FormFieldValidator<T> apply<T>(
    BuildContext context,
    List<Validation<T>> validations,
  ) {
    return (T? value) {
      for (final validation in validations) {
        final error = validation.validate(context, value);
        if (error != null) return error;
      }
      return null;
    };
  }
}
