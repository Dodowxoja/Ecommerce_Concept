import 'package:ecommerce/routes/my_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Concept ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: MyRoutes.instance.onGenerate,
      initialRoute: "/splash_screen",
    );
  }
}
