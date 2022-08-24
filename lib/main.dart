import 'package:flutter/material.dart';
import 'package:new_app/page/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(          // MODIFY with const
      debugShowCheckedModeBanner: false,
      title: 'Nubank Design Inspiration',
      theme: ThemeData(          // Add the 5 lines from here...
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),             // REMOVE Scaffold
    );
  }
}
