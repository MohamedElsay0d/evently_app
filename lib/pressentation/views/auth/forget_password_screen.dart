import 'package:evently_app/pressentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../themes/app_theme.dart';
import '../../widgets/custom_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const routeName = '/forget-password';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.forgetPassword,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppTheme.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/forgetPass.png',
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(hintText: AppLocalizations.of(context)!.email, icon: 'email'),
              SizedBox(
                height: 24,
              ),
              CustomButton(
                label: AppLocalizations.of(context)!.resetPassword,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
