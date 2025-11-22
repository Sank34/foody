import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foody/firebase_options.dart';
import 'package:foody/models/restaurant.dart';
import 'package:foody/services/auth/auth_gate.dart';
import 'package:foody/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const Foody(),
    ),
  );
}

class Foody extends StatelessWidget {
  const Foody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
