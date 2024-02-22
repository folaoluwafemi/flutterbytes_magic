import 'package:flutter/material.dart';
import 'package:flutterbytes_magic/src/entities/app/theme/app_theme.dart';
import 'package:flutterbytes_magic/src/entities/magic/magic_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const MagicPage(),
    );
  }
}
