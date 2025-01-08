import 'package:evently_app/pressentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Image.asset(
            'assets/images/Logo.png',
            height: MediaQuery.of(context).size.height * 0.2,
            fit: BoxFit.fill,
          ),
          CustomTextFormField(
              icon: 'email', hintText: 'Email' , controller: TextEditingController(),),
          CustomTextFormField(
              icon: 'password', hintText: 'Password', controller: TextEditingController(), pass: true),
        ],
      ),
    ));
  }
}
