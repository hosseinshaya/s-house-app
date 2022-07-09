/* import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:s_house/common/localization/locale_keys.g.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';
import 'package:s_house/common/uikit/form/cin_textfield.dart';
import 'package:s_house/common/utils/datetime_helper.dart';
import 'package:s_house/common/utils/form_validators.dart';
import 'package:s_house/common/utils/locale_helper.dart';
import 'package:s_house/common/utils/modal_helper.dart';

enum CalendarEnum { gregorian, jalali }

typedef DatePickerType = DateTime?;

class CinDatePicker extends StatefulWidget {
  const CinDatePicker({
    required this.name,
    required this.label,
    this.hint,
    Key? key,
    this.initialDate,
    this.calendar = CalendarEnum.gregorian,
    this.focusNode,
    this.style,
    this.labelStyle,
    this.textAlignVertical,
    this.toolbarOptions,
    this.showCursor,
    this.onChanged,
    this.padding,
    this.validators = const [],
    this.isRequired = false,
  }) : super(key: key);
  final DatePickerType? initialDate;
  final CalendarEnum calendar;
  final String name;
  final String label;
  final String? hint;
  final FocusNode? focusNode;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextAlignVertical? textAlignVertical;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final ValueChanged<DatePickerType>? onChanged;
  final EdgeInsets? padding;
  final List<FormFieldValidator<String>> validators;
  final bool isRequired;

  @override
  _CinDatePickerState createState() => _CinDatePickerState();
}

class _CinDatePickerState extends State<CinDatePicker> {
  DatePickerType? dateTime;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) => FormBuilderField<DatePickerType>(
        name: widget.name,
        validator: FormBuilderValidators.compose(
            List.from(widget.validators)..addAll([if (widget.isRequired) FormValidators.required(context)])),
        initialValue: widget.initialDate,
        builder: (FormFieldState<DatePickerType> field) => Builder(
          builder: (context) {
            dateTime = field.value;
            if (dateTime != null) {
              textEditingController.text = dateTime!.format() ?? '';
            }
            return CinTextField(
              name: 'datePickerTextField',
              validators: widget.validators,
              isRequired: widget.isRequired,
              hint: widget.hint ?? LocaleKeys.common_choose.tr(),
              readOnly: true,
              controller: textEditingController,
              label: widget.label,
              focusNode: widget.focusNode,
              style: widget.style ??
                  Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontFamily: context.localeNumericFont, color: ColorPalette.of(context).textCaption),
              textDirection: context.localeDirection,
              labelStyle: widget.labelStyle,
              textAlignVertical: widget.textAlignVertical,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              padding: widget.padding,
              suffixIcon: Icon(
                Icons.today_rounded,
                size: 22,
                color: ColorPalette.of(context).icon,
              ),
              onTap: () async {
                context.showModal(
                  DatePickerModal(
                    initialDate: dateTime ?? DateTime.now(),
                    onSubmit: (DateTime date) async {
                      textEditingController.text = date.format() ?? '';
                      field.didChange(date);
                    },
                  ),
                );
              },
            );
          },
        ),
      );
}
 */