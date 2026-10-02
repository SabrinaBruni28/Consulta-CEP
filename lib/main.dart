import 'package:flutter_cep/core/theme/app_theme.dart';
import 'package:flutter_cep/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterCepApp());
}

class FlutterCepApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Nome do Sistema
      title: "Consulta de CEP",

      // Temas
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Tela inicial
      home: HomeScreen(),
    );
  }
}
