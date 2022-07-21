import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

// ---Texts---
const _kListRuru = 'List Ruru';

// ---Parameters---
const _kPadding = 10.0;

class ListCheckBoxForm extends FormField<bool> {
  ListCheckBoxForm({
    Key? key,
    required FormFieldSetter<bool> onSaved,
    FormFieldValidator<bool>? validator,
    required bool selectedCheckBox,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (state) {
            return ListCheckbox(
              isSelected: state.value ?? selectedCheckBox,
              onChanged: state.didChange,
            );
          },
        );
}

class ListCheckbox extends StatelessWidget {
  const ListCheckbox({
    Key? key,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<bool> onChanged;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: _kPadding,
        left: _kPadding,
        right: _kPadding,
      ),
      child: Container(
        color: AppColors.backgroundButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: _kPadding),
              child: Text(
                _kListRuru,
                style: context.theme.textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: _kPadding),
              child: Checkbox(
                value: isSelected,
                onChanged: (value) {
                  onChanged(value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
