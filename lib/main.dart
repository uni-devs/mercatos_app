import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_themes.dart';
import 'package:mercatos/features/auth/features/login/presentations/widgets/background_widget.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'Mercatos',
        theme: MercatosThemes.data,
        home: const VideoPage(),
      ),
    );
  }
}
