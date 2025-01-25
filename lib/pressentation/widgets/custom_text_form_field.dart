import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String? icon;
  final String hintText;
  final bool pass;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.icon,
    this.validator,
    this.onChanged,
    this.pass = false,
    this.maxLines = 1,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.pass;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        prefixIcon: widget.icon != null
            ? SvgPicture.asset(
                'assets/icons/${widget.icon}.svg',
                height: 20,
                width: 24,
                fit: BoxFit.scaleDown,
              )
            : null,
        hintText: widget.hintText,
        suffixIcon: widget.pass
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.pass ? TextInputType.visiblePassword : null,
      maxLines: widget.maxLines,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
