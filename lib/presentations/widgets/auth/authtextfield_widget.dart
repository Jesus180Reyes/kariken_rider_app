import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  final String hintText;
  final bool? isPassword;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  const AuthTextfield({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.textInputType = TextInputType.emailAddress,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.all(15),
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0XFFE3E3E3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isPassword!,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
