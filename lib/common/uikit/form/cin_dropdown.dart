import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CinDropdown<T> extends StatefulWidget {
  const CinDropdown({
    required this.name,
    required this.values,
    required this.initialValue,
    Key? key,
    this.labelStyle,
    this.resolveItemText,
    this.onChanged,
    this.padding = const EdgeInsets.all(6),
    this.labelPadding = const EdgeInsets.all(8),
    this.label = '',
    this.enabled = true,
  }) : super(key: key);

  final String label;
  final String name;
  final String Function(T item)? resolveItemText;
  final List<T> values;
  final T initialValue;
  final Function(T?)? onChanged;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final EdgeInsetsGeometry labelPadding;

  @override
  State<CinDropdown<T>> createState() => _CinDropdownState<T>();
}

class _CinDropdownState<T> extends State<CinDropdown<T>> {
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
                  widget.label,
                  style: widget.labelStyle ?? Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.start,
                ),
              ),
            FormBuilderDropdown<T>(
              name: widget.name,
              enabled: widget.enabled,
              initialValue: widget.initialValue,
              onChanged: widget.onChanged,
              items: List<DropdownMenuItem<T>>.generate(
                widget.values.length,
                (index) => DropdownMenuItem(
                  value: widget.values[index],
                  child: Text(
                    widget.resolveItemText == null
                        ? widget.values[index].toString()
                        : widget.resolveItemText!(widget.values[index]).toString(),
                  ), //widget.values[index].toString()),
                ),
              ),
            ),
          ],
        ),
      );
}
