import 'package:flutter/material.dart';

class DateFormField extends StatelessWidget {
  final TextEditingController controller;
  final DateTime? startDate;
  final Function(DateTime?) onTap;
  final String? Function(String? value)? validator;
  final String label;
  final String hint;

  const DateFormField({
    super.key,
    required this.controller,
    this.validator,
    this.startDate,
    required this.onTap,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    void onTapField() {
      final value = startDate != null
          ? startDate!.add(const Duration(days: 1))
          : DateTime.now();

      showDatePicker(
        context: context,
        initialDate: value,
        firstDate: value,
        lastDate: DateTime(DateTime.now().year + 1),
      ).then(onTap);
    }

    return InkWell(
      onTap: onTapField,
      child: TextFormField(
        enabled: false,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
