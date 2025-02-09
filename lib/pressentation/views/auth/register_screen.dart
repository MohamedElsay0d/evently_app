import 'package:evently_app/pressentation/views/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Data/services/firebase_service.dart';
import '../../../provider/user_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    UsersProvider usersProvider =
        Provider.of<UsersProvider>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.register,
            style: Theme.of(context).textTheme.titleLarge!,
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
                      controller: nameController,
                      icon: 'name',
                      hintText: AppLocalizations.of(context)!.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      icon: 'email',
                      hintText: AppLocalizations.of(context)!.email,
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
                      hintText: AppLocalizations.of(context)!.password,
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
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      icon: 'password',
                      hintText: AppLocalizations.of(context)!.rePassword,
                      pass: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        } else if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    )
                  ]),
                ),
                SizedBox(
                  height: 22,
                ),
                CustomButton(
                  label: AppLocalizations.of(context)!.register,
                  onPress: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        await FirebaseService.register(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ).then((user) {
                          usersProvider.updateUser(user);
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                          Fluttertoast.showToast(
                            msg: 'Account created successfully',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        });
                      } catch (error) {
                        String? msg;
                        msg = error is FirebaseAuthException
                            ? error.message
                            : "Something went wrong";
                        Fluttertoast.showToast(
                          msg: msg!,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } finally {
                        setState(() {
                          isLoading = false; 
                        });
                      }
                    }
                  },
                  isLoading: isLoading, 
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.haveAccount,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      child: Text(
                        AppLocalizations.of(context)!.login,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
