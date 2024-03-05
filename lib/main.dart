import 'package:flutter/material.dart';
import 'package:preorder/screens/start.dart';
import 'package:preorder/screens/view.dart';

var routes = <String, WidgetBuilder>{
  "/StartScreen": (BuildContext context) => const StartScreen(),
  "/ViewScreen": (BuildContext context) => const ViewScreen(),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartScreen(),
      routes: routes,
    );
  }
}
