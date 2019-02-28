import 'package:flutter/material.dart';
import 'package:ready_to_go/src/app.dart';
import 'package:ready_to_go/src/config/flavor_config.dart';

void main() {
  FlavorConfig(flavor: Flavor.PRODUCTION,
      values: FlavorValues(baseUrl: "prod"));

  runApp(MyApp());
}