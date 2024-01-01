import 'package:flutter/material.dart';
import 'package:proje_1/burc_listesi.dart';
import 'package:proje_1/routes/route_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
    
  }
}
