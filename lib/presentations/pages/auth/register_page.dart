import 'package:flutter/material.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Welcome to Kariken"),
      ),
      body: SingleChildScrollView(
        child: _RegisterForm(
          emailController: emailController,
          lastNameController: lastNameController,
          nameController: nameController,
          passwordController: passwordController,
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const _RegisterForm(
      {Key? key,
      required this.nameController,
      required this.lastNameController,
      required this.emailController,
      required this.passwordController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SvgWidget(svgPath: 'assets/svgs/auth/register.svg'),
        const TitleAuthWidget(title: 'Registrate'),
        AuthTextfield(
          hintText: 'Ingresa tu Nombre',
          controller: nameController,
        ),
        AuthTextfield(
          hintText: 'Ingresa tus Apellidos',
          controller: lastNameController,
        ),
        AuthTextfield(
          hintText: 'Ingresa tu correo electronico',
          controller: emailController,
        ),
        AuthTextfield(
          hintText: 'Contrasena',
          isPassword: true,
          controller: passwordController,
        ),
        InkWell(
          onTap: () => Navigator.pushReplacementNamed(context, "login"),
          child: const Text("Ya tienes una cuenta? Inicia Sesion"),
        ),
        AuthButtonWidget(
          title: 'Registrarse',
          onTap: () => Navigator.pushReplacementNamed(context, "home"),
        ),
      ],
    );
  }
}
