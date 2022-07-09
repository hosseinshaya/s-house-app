/* import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:s_house/common/utils/direction.dart';
import 'package:s_house/common/utils/form_validators.dart';

class CinRatingBar extends StatelessWidget {
  const CinRatingBar({
    required this.name,
    Key? key,
    this.size = 26.0,
    this.itemPadding = const EdgeInsets.all(6),
    this.enabled = true,
    this.validators = const [],
    this.isRequired = false,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final String name;
  final double size;
  final EdgeInsetsGeometry itemPadding;
  final bool enabled;
  final bool isRequired;
  final List<FormFieldValidator<String>> validators;
  final AutovalidateMode autoValidateMode;

  @override
  Widget build(BuildContext context) => FormBuilderField<double?>(
      name: name,
      validator: FormBuilderValidators.compose(
          List.from(validators)..addAll([if (isRequired) FormValidators.required(context)])),
      autovalidateMode: autoValidateMode,
      builder: (FormFieldState<dynamic> field) {
        bool showError = field.value == null && field.hasError;
        return Directionality(
          textDirection: Direction.ltr,
          child: Column(
            children: [
              RatingBar(
                initialRating: double.parse((field.value ?? 0).toString()),
                ignoreGestures: !enabled,
                itemSize: size,
                glow: false,
                textDirection: TextDirection.ltr,
                itemPadding: itemPadding,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star_rounded, size: size, color: context.colors.warning),
                  half: Icon(Icons.star_half_rounded, size: size, color: context.colors.warning),
                  empty: Icon(Icons.star_border_rounded,
                      size: size, color: showError ? context.colors.error.withOpacity(0.35) : context.colors.disabled),
                ),
                onRatingUpdate: (double rating) {
                  field.didChange(rating == 0 ? null : rating);
                },
              ),
              Switcher(
                child: !showError && field.errorText == null
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(field.errorText!,
                            style: context.textTheme.caption!
                                .copyWith(fontWeight: FontWeight.w800, color: context.colors.error.dark)),
                      ),
              ),
            ],
          ),
        );
      });
}
 */