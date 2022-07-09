import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:s_house/common/localization/locale_keys.g.dart';
import 'package:s_house/common/utils/string_helper.dart';

typedef Validator = String? Function(dynamic param);

class FormValidators {
  static String? phoneNumber(String? text) =>
      RegExp('^9\\d{9}\$').hasMatch(text ?? '')
          ? null
          : LocaleKeys.validator_wrongPhoneNumber.tr();

  static String? phoneNumberWithZero(String? text) =>
      RegExp('^09\\d{9}\$').hasMatch(text ?? '')
          ? null
          : LocaleKeys.validator_wrongPhoneNumber.tr();

  static String? phoneNumberAll(String? text) =>
      RegExp('^\\d{0,1}9\\d{9}\$').hasMatch(text ?? '')
          ? null
          : LocaleKeys.validator_wrongPhoneNumber.tr();

  static String? onlyNumbers(String? text) =>
      RegExp('^[0-9]*\$').hasMatch(text ?? '')
          ? null
          : LocaleKeys.validator_onlyNumbers.tr();

  static Validator required(BuildContext context) =>
      FormBuilderValidators.required(
        context,
        errorText: LocaleKeys.validator_requiredField.tr(),
      );

  static String? nationalNumberValidator(String? text) {
    String code = text ?? '';
    int control = 0;
    if (code.length < 10) {
      return null;
    } else {
      List<int> values = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
      List<String> temp = code.split('');
      for (int i = 0; i < temp.length; i++) {
        control += values[i] * int.parse(temp[i]);
      }
    }
    return (control % 11 == 0)
        ? null
        : LocaleKeys.validator_nationalNumberInvalid.tr();
  }

  static FormFieldValidator maxPrice(
    BuildContext context,
    num max, {
    String? errorText,
  }) =>
      (valueCandidate) {
        if (valueCandidate != null) {
          valueCandidate = valueCandidate.toString().replaceAll(',', '');
          if ((valueCandidate is num && valueCandidate > max) ||
              (valueCandidate is String &&
                  num.tryParse(valueCandidate) != null &&
                  num.tryParse(valueCandidate)! > max)) {
            return errorText ?? LocaleKeys.validator_priceMoreThanAllowed.tr();
          }
        }
        return null;
      };

  static FormFieldValidator minPrice(
    BuildContext context,
    num min, {
    String? errorText,
  }) =>
      (valueCandidate) {
        if (valueCandidate != null) {
          valueCandidate = valueCandidate.toString().replaceAll(',', '');
          if ((valueCandidate is num && valueCandidate < min) ||
              (valueCandidate is String &&
                  num.tryParse(valueCandidate) != null &&
                  num.tryParse(valueCandidate)! < min)) {
            return errorText ??
                LocaleKeys.validator_priceCanNotBeLess
                    .tr(args: <String>[min.toString().currencyFormatter()]);
          }
        }
        return null;
      };

  static FormFieldValidator<T> compose<T>(
          List<FormFieldValidator<T>> validators) =>
      (valueCandidate) {
        for (FormFieldValidator<T> validator in validators) {
          final String? validatorResult = validator.call(valueCandidate);
          if (validatorResult != null) {
            return validatorResult;
          }
        }
        return null;
      };
}
