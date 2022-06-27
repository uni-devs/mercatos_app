import 'package:flutter/material.dart';
import 'package:mercatos/features/auth/features/login/presentations/login_screen.dart';

import 'dependencies/dependencies.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
