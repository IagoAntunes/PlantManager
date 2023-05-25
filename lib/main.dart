import 'package:flutter/material.dart';
import 'package:plantmanager/features/splash/pages/splash_page.dart';
import 'package:provider/provider.dart';

import 'features/home/store/home.store.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashPage(),
    );
  }
}
