import 'package:flutter/material.dart';

import '../../core/constants/app_theme_const.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final double? cursorWidth;
  final Color? borderColor;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.cursorWidth,
    this.borderColor,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      cursorColor: AppThemeConst.primaryColor,
      cursorWidth: widget.cursorWidth ?? 2,
      controller: widget.controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        fillColor: const Color.fromARGB(255, 243, 242, 242),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? Color.fromARGB(255, 255, 252, 252),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
