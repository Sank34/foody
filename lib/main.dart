import 'package:flutter/material.dart';
import 'package:foody/auth/login_or_register.dart';
import 'package:foody/pages/login_page.dart';
import 'package:foody/pages/register_page.dart';
import 'package:foody/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: Foody(),
));

class Foody extends StatelessWidget {
  const Foody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
