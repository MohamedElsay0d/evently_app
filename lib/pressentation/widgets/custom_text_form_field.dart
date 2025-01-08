import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String? icon;
  final String hintText;
  final bool pass;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.icon,
      this.validator,
      this.pass = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
          controller: controller,
          obscureText: pass,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              borderSide: BorderSide(width: 1.0),
            ),
            prefixIcon: icon != null
                ? SvgPicture.asset(
                    'assets/icons/$icon.svg',
                  )
                : null,
            hintText: hintText,
            suffix: pass ? Icon(Icons.remove_red_eye) : null,
          ),
          validator: validator),
    );
  }
}
