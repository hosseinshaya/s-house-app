import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:s_house/common/styles/appTheme/app_theme_helper.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/common/utils/form_validators.dart';

class CinRadioGroup<T> extends StatefulWidget {
  const CinRadioGroup({
    required this.name,
    required this.values,
    Key? key,
    this.initialValue,
    this.labelStyle,
    this.resolveItemText,
    this.padding,
    this.labelPadding,
    this.label = '',
    this.wrapSpacing,
    this.wrapRunSpacing,
    this.validators = const [],
    this.isRequired = false,
    this.layoutBuilder,
  }) : super(key: key);

  final String label;
  final String name;
  final String Function(T item)? resolveItemText;
  final Widget? Function(T item)? layoutBuilder;
  final List<T> values;
  final T? initialValue;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;
  final double? wrapSpacing;
  final double? wrapRunSpacing;
  final List<FormFieldValidator<String>> validators;
  final bool isRequired;

  @override
  State<CinRadioGroup<T>> createState() => _CinRadioGroupState<T>();
}

class _CinRadioGroupState<T> extends State<CinRadioGroup<T>> {
  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label.isNotEmpty)
              Padding(
                padding: widget.labelPadding ?? EdgeInsets.zero,
                child: Text(
                  '${widget.label}${widget.isRequired ? ' *' : ''}',
                  style:
                      widget.labelStyle ?? Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w900),
                  textAlign: TextAlign.start,
                ),
              ),
            FormBuilderRadioGroup<T>(
              name: widget.name,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.only(top: 12),
                isDense: true,
                border: InputBorder.none,
                errorStyle:
                    context.textTheme.caption!.copyWith(fontWeight: FontWeight.w800, color: context.colors.error.dark),
              ),
              initialValue: widget.initialValue,
              options: List<FormBuilderFieldOption<T>>.generate(
                widget.values.length,
                (index) => FormBuilderFieldOption(
                  value: widget.values[index],
                  child: widget.layoutBuilder != null
                      ? widget.layoutBuilder!(widget.values[index])
                      : Text(
                          widget.resolveItemText == null
                              ? widget.values[index].toString()
                              : widget.resolveItemText!(widget.values[index]).toString(),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                ),
              ),
              wrapRunSpacing: widget.wrapRunSpacing ?? 12,
              wrapSpacing: widget.wrapSpacing ?? 12,
              validator: FormBuilderValidators.compose(
                  List.from(widget.validators)..addAll([if (widget.isRequired) FormValidators.required(context)])),
            ),
          ],
        ),
      );
}
