import 'package:flutter/material.dart';
import 'package:learning_bloc/features/home/ui/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(appBarTheme: const AppBarTheme(backgroundColor: Colors.teal)),
      home: const Home(),
    );
  }
}
