import 'package:flutter/material.dart';
import 'package:product_list/view/screens/main_screen.dart';

class BurningBrosApp extends StatelessWidget {
  const BurningBrosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
