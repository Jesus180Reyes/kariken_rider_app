import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/presentations/widgets/widgets.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          height: 200,
          child: SvgPicture.asset(
            "assets/svgs/auth/mobile.svg",
          ),
        ),
        const Text(
          "Ingresa tu numero de telefono para Registrarte",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const AuthTextfield(hintText: "Ingresa numero de telefono"),
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: 230,
          height: 55,
          child: FilledButton.tonal(
            onPressed: () {},
            child: const Text(
              "Enviar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
