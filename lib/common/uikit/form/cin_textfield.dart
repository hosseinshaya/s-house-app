import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' as intl;
import 'package:s_house/common/styles/colorPalette/color_palette.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/common/utils/form_validators.dart';
import 'package:s_house/common/utils/locale_helper.dart';

class CinTextField extends StatefulWidget {
  const CinTextField({
    Key? key,
    required this.name,
    this.controller,
    this.initialValue,
    this.hint,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.toolbarOptions,
    this.showCursor,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.onSaved,
    this.onReset,
    this.inputFormatters,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.autofillHints,
    this.strutStyle,
    this.scrollPhysics,
    this.scrollController,
    this.labelStyle,
    this.mouseCursor,
    this.valueTransformer,
    this.enabled = true,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.labelPadding = const EdgeInsets.all(8),
    this.label = '',
    this.maxLines = 1,
    this.textAlignVertical = TextAlignVertical.top,
    this.validators = const [],
    this.decoration,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.maxLengthEnforcement = MaxLengthEnforcement.enforced,
    this.enableSuggestions = true,
    this.expands = false,
    this.cursorWidth = 2.0,
    this.enableInteractiveSelection = true,
    this.padding,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.contentPadding,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.hintStyle,
    this.isRequired = false,
    this.obscure = false,
  }) : super(key: key);
  final String name;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hint;
  final String label;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
  final TextAlignVertical? textAlignVertical;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool autocorrect;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool enableSuggestions;
  final int maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String?>? onChanged;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onReset;
  final VoidCallback? onEditingComplete;
  final FormFieldSetter<String>? onSaved;
  final FormFieldSetter<String>? onSubmitted;
  final List<FormFieldValidator<String>> validators;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final InputCounterWidgetBuilder? buildCounter;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autoValidateMode;
  final StrutStyle? strutStyle;
  final bool enableInteractiveSelection;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsets scrollPadding;
  final ScrollController? scrollController;
  final EdgeInsets? padding;
  final EdgeInsets labelPadding;
  final MouseCursor? mouseCursor;
  final ValueTransformer<String?>? valueTransformer;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final bool isRequired;
  final bool obscure;
  final EdgeInsetsGeometry? contentPadding;

  @override
  _CinTextFieldState createState() => _CinTextFieldState();
}

class _CinTextFieldState extends State<CinTextField>
    with AfterLayoutMixin<CinTextField> {
  TextDirection textDirection = TextDirection.ltr;
  bool showText = true;

  bool showError = false;

  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label.isNotEmpty)
              Padding(
                padding: widget.labelPadding,
                child: Text(
                  '${widget.label}${widget.isRequired ? ' *' : ''}',
                  style: widget.labelStyle ??
                      Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.w900),
                  textAlign: TextAlign.start,
                ),
              ),
            FormBuilderTextField(
              key: Key(widget.name),
              name: widget.name,
              obscureText: widget.obscure ? showText : false,
              controller: widget.controller,
              initialValue: widget.initialValue,
              focusNode: widget.focusNode,
              decoration: widget.decoration ??
                  InputDecoration(
                    hintText: widget.hint,
                    hintStyle: widget.hintStyle ??
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ColorPalette.of(context).textDisabled),
                    fillColor: ColorPalette.of(context).background,
                    hoverColor: Colors.transparent,
                    isDense: true,
                    contentPadding: widget.contentPadding ??
                        const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 16),
                    focusedBorder: widget.readOnly
                        ? _defaultBorder(context)
                        : _focusBorder(context),
                    enabledBorder: _defaultBorder(context),
                    errorBorder: _errorBorder(context),
                    focusedErrorBorder: _errorBorder(context),
                    errorStyle: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ColorPalette.of(context).error.dark),
                    prefixIconColor: context.colors.icon,
                    prefixIcon: widget.prefixIcon,
                    prefix: widget.prefix,
                    suffixIcon: widget.obscure
                        ? IconButton(
                            icon: Icon(Icons.remove_red_eye_rounded,
                                color: ColorPalette.of(context).icon),
                            onPressed: () {
                              setState(() {
                                showText = !showText;
                              });
                            },
                          )
                        : widget.suffixIcon,
                  ),
              keyboardType: widget.keyboardType,
              textCapitalization: widget.textCapitalization,
              textInputAction: widget.textInputAction,
              style: widget.style ?? Theme.of(context).textTheme.bodyText1,
              textDirection: widget.textDirection ?? textDirection,
              textAlign: widget.textAlign,
              autofocus: widget.autofocus,
              readOnly: widget.readOnly,
              textAlignVertical: widget.textAlignVertical,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              obscuringCharacter: widget.obscuringCharacter,
              autocorrect: widget.autocorrect,
              maxLengthEnforcement: widget.maxLengthEnforcement,
              enableSuggestions: widget.enableSuggestions,
              maxLines: widget.expands ? 1 : widget.maxLines,
              minLines: widget.expands ? null : widget.minLines,
              expands: widget.expands,
              maxLength: widget.maxLength,
              onChanged: (String? value) {
                setTextDirection(context, value);
                widget.onChanged?.call(value);
                if ((value?.length ?? 0) > 0) {
                  setState(() {
                    showError = true;
                  });
                }
              },
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onSaved: widget.onSaved,
              onSubmitted: widget.onSubmitted,
              onReset: widget.onReset,
              validator: FormBuilderValidators.compose(List.from(
                  widget.validators)
                ..addAll(
                    [if (widget.isRequired) FormValidators.required(context)])),
              inputFormatters: widget.inputFormatters,
              enabled: widget.enabled,
              cursorWidth: widget.cursorWidth,
              cursorRadius: widget.cursorRadius,
              cursorColor:
                  widget.cursorColor ?? ColorPalette.of(context).cursor,
              keyboardAppearance: widget.keyboardAppearance,
              buildCounter: widget.buildCounter,
              autofillHints: widget.autofillHints,
              autovalidateMode: showError
                  ? widget.autoValidateMode
                  : AutovalidateMode.disabled,
              strutStyle: widget.strutStyle,
              mouseCursor: widget.mouseCursor,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              scrollPhysics: widget.scrollPhysics,
              scrollPadding: widget.scrollPadding,
              scrollController: widget.scrollController,
              valueTransformer: widget.valueTransformer,
            ),
          ],
        ),
      );

  OutlineInputBorder _errorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: ColorPalette.of(context).error,
        width: 2,
      ),
    );
  }

  OutlineInputBorder _defaultBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: ColorPalette.of(context).background,
      ),
    );
  }

  OutlineInputBorder _focusBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: ColorPalette.of(context).primary,
        width: 2,
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setTextDirection(context, widget.initialValue);
  }

  void setTextDirection(BuildContext context, String? value) {
    String directionValue = (value ?? '').trim();
    setState(() {
      textDirection = directionValue == ''
          ? context.localeDirection
          : intl.Bidi.detectRtlDirectionality(directionValue)
              ? TextDirection.rtl
              : TextDirection.ltr;
    });
  }
}
