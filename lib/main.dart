import 'package:flutter/material.dart';
import 'package:go/src/core/core.dart';
import 'package:go/src/features/features.dart';

void main() {
  runApp(const GoApp());
}

class GoApp extends StatelessWidget {
  const GoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia de Motéis GO',
      theme: GoTheme.theme,
      home: HomePage(),
    );
  }
}
