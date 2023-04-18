import 'package:flutter/material.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Welcome to Kariken"),
      ),
      body: SingleChildScrollView(
        child: LoginForm(
          emailController: emailController,
          passwordController: passwordController,
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SvgWidget(svgPath: 'assets/svgs/auth/login.svg'),
          const TitleAuthWidget(title: 'Inicia Sesion'),
          AuthTextfield(
            hintText: 'Ingresa tu correo electronico',
            controller: emailController,
          ),
          AuthTextfield(
            hintText: 'Contrasena',
            isPassword: true,
            textInputType: TextInputType.text,
            controller: passwordController,
          ),
          InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, "register"),
            child: const Text("Aun no estas registrado?, Registrate ahora"),
          ),
          AuthButtonWidget(
            title: 'Iniciar Sesion',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
