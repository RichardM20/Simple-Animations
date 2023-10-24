import 'package:animations/src/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    this.isPassword,
    required this.textEditingController,
    required this.hintText,
  });
  final bool? isPassword;
  final TextEditingController textEditingController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final borderstyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        50,
      ),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
        width: 0.5,
      ),
    );

    final focusBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: ColorsApp.primary,
        width: 2.5,
      ),
    );
    return TextFormField(
      obscureText: isPassword ?? false,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        border: borderstyle,
        focusedBorder: focusBorderStyle,
      ),
    );
  }
}
