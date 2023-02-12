import 'package:fforward_adm/resources/app_strings.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback onTapSubmit;
  final List<Widget> children;

  const FormContainer({
    super.key,
    required this.formKey,
    required this.onTapSubmit,
    required this.children,
  });

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: children,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: onTapSubmit,
                child: const Text(AppStrings.submit),
              ),
            ],
          ),
        ),
      );
}
