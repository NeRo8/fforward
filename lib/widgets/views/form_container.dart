import 'package:fforward_adm/resources/app_strings.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function({bool withContinue}) onTapSubmit;
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: children,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => onTapSubmit(withContinue: true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      child: const Text(AppStrings.createAndContinue),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onTapSubmit,
                      child: const Text(AppStrings.create),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
