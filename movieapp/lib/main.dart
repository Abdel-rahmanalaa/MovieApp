import 'package:flutter/material.dart';
import 'package:movieapp/core/services/services_locator.dart';
import 'package:movieapp/movies/presentation/ui/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: const Color(0xFF303030),
      ),
      home: const StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MoviesScreen())),
          child: const Text('Button'),
        ),
      ),
    );
  }
}
