import 'package:fforward_adm/auth/pages/login/controller/login_controllers.dart';
import 'package:fforward_adm/auth/pages/registration/view/registration_page.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/views/auth_form_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login-page';

  final LoginController _controller = Get.find<LoginController>();

  LoginPage({super.key});

  void onTapRegistration() => Get.toNamed(RegistrationPage.routeName);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Sign in'),
          actions: [
            IconButton(
              onPressed: onTapRegistration,
              icon: const Icon(Icons.edit_note_rounded),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: AuthFormContainer(
          child: Form(
            key: _controller.logFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.signIn,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 52,
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
                  validator: (value) =>
                      value!.isEmpty ? AppStrings.requiredField : null,
                  controller: _controller.passwordController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.password,
                    hintText: AppStrings.hintEnterPassword,
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
                ElevatedButton(
                  onPressed: _controller.onTapSubmit,
                  child: const Text(AppStrings.signIn),
                )
              ],
            ),
          ),
        ),
      );
}
