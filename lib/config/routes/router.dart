import 'package:flutter/material.dart';

import '../../presentations/pages/pages.dart';

class Routes {
  static const String initialRoute = "home";

  static final Map<String, Widget Function(BuildContext)> router = {
    "home": (_) => const HomePage(),
    "register": (_) => const RegisterPage(),
    "login": (_) => const LoginPage(),
    "phone-verify": (_) => const PhoneVerificationPage(),
    "map": (_) => const MapPage(),
  };
}
