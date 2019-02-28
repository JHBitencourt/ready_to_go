import 'package:flutter/material.dart';
import 'package:ready_to_go/src/app/ui/pages/home_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ready to Go',
      home: HomePage(),
    );
  }

}