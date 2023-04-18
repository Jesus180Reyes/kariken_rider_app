import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/titleauth_widget.dart';

class AuthFormWidget extends StatelessWidget {
  final String svgPath;
  final String btnTitle;
  const AuthFormWidget({
    super.key,
    required this.svgPath,
    required this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 120,
          child: SvgPicture.asset(
            svgPath,
          ),
        ),
        const TitleAuthWidget(title: 'Login'),
        Container(
          padding: const EdgeInsets.only(left: 15),
          margin: const EdgeInsets.all(15),
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0XFFE3E3E3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Ingresa tu correo electronico",
                border: InputBorder.none,
              )),
        ),
        TextFormField(),
        SizedBox(
          width: size.width - 100,
          height: 50,
          child: FilledButton.tonal(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                btnTitle.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
