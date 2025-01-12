import 'package:evently_app/pressentation/views/auth/widgets/button_with_image.dart';
import 'package:evently_app/pressentation/widgets/custom_button.dart';
import 'package:evently_app/pressentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../homepage/home_page.dart';
import 'forget_password_screen.dart';
import 'register_screen.dart';
import 'widgets/custom_divider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 24,
                ),
                Form(
                  key: formKey,
                  child: Column(children: [
                    CustomTextFormField(
                      icon: 'email',
                      hintText: 'Email',
                      controller: emailController,
                      validator: (value) {
                        String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        RegExp regex = RegExp(pattern);
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (!regex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      icon: 'password',
                      hintText: 'Password',
                      controller: passwordController,
                      pass: true,
                      validator: (value) {
                        String pattern =
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                        RegExp regex = RegExp(pattern);
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        } else if (!regex.hasMatch(value)) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                    ),
                  ]),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      'Forgot Password?',
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ForgetPasswordScreen.routeName);
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                CustomButton(
                  label: 'Login',
                  onPress: () {
                    /*
                    if (formKey.currentState!.validate()) {
                      log('Login');
                    }
                    */
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      child: Text(
                        'Create an account',
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreen.routeName);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomDivider(),
                SizedBox(
                  height: 22,
                ),
                ButtonWithImage()
              ],
            ),
          ),
        ));
  }
}
