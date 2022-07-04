import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_themes.dart';
import 'dependencies/dependencies.dart';
import 'features/auth/features/registration/presentation/registration_screen.dart';

void main() async {
  await DependencyInjection().registerSingleton(const MercatosApp());

  runApp(const MercatosApp());
}

class MercatosApp extends StatelessWidget {
  const MercatosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DependencySetup().setUp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mercatos',
        theme: MercatosThemes.data,
        home: const RegistrationScreen(),
      ),
    );
  }
}
