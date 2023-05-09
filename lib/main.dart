import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/config/routes/router.dart';
import 'package:rider_app/config/theme/app_theme.dart';
import 'presentations/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchPlacesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MapProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rider App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      theme: AppTheme().theme(),
      routes: Routes.router,
    );
  }
}
