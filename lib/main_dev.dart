import 'package:flutter/material.dart';
import 'package:ready_to_go/src/app.dart';
import 'package:ready_to_go/src/config/flavor_config.dart';

void main() {
  FlavorConfig(flavor: Flavor.DEV,
      color: Colors.green,
      values: FlavorValues(baseUrl: "")
  );

  runApp(MyApp());
}