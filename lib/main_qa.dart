import 'package:flutter/material.dart';
import 'package:ready_to_go/src/app.dart';
import 'package:ready_to_go/src/config/flavor_config.dart';

void main() {
  FlavorConfig(flavor: Flavor.QA,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(baseUrl: "qa"));

  runApp(MyApp());
}