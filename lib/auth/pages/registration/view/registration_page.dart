import 'package:fforward_adm/auth/pages/registration/controller/registration_controllers.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/form_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  static const routeName = '/registration-page';

  final RegistrationController _controller = Get.find<RegistrationController>();

  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.signUp),
        ),
        body: FormContainer(
          child: Form(
            key: _controller.regFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.signUp,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 52,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? AppStrings.requiredField : null,
                  controller: _controller.firstnameController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.firstname,
                    hintText: AppStrings.hintEnterFirstName,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? AppStrings.requiredField : null,
                  controller: _controller.lastnameController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.lastname,
                    hintText: AppStrings.hintEnterLastName,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? AppStrings.requiredField : null,
                  controller: _controller.emailController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.email,
                    hintText: AppStrings.hintEnterEmail,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) => value!.isEmpty
                      ? AppStrings.requiredField
                      : _controller.passwordController.text !=
                              _controller.confirmPasswordController.text
                          ? AppStrings.passwordsNotMatch
                          : null,
                  controller: _controller.passwordController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.password,
                    hintText: AppStrings.hintEnterPassword,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) => value!.isEmpty
                      ? AppStrings.requiredField
                      : _controller.passwordController.text !=
                              _controller.confirmPasswordController.text
                          ? AppStrings.passwordsNotMatch
                          : null,
                  controller: _controller.confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.confirmPassword,
                    hintText: AppStrings.hintEnterConrifmPassword,
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
                ElevatedButton(
                  onPressed: _controller.onTabSubmit,
                  child: const Text(AppStrings.signUp),
                ),
              ],
            ),
          ),
        ),
      );
}
