
import 'package:flutter/material.dart';

import 'package:goldy/core/routes/routes.dart';
import 'package:goldy/core/ui/home_screen.dart';

import 'package:goldy/feature/gold/ui/view/gold_screen.dart';
import 'package:goldy/feature/silver/ui/silver_screen.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
   
  ));
}

class MyApp extends StatelessWidget {
 

  const MyApp({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        AppRoutes.goldScreen: (context) => const GoldScreen(),
        AppRoutes.silverScreen: (context) => const SilverScreen(),
      },
    );
  }
}
