import 'package:flutter/material.dart';
import 'package:ready_to_go/src/app.dart';
import 'package:ready_to_go/src/config/flavor_config.dart';

void main() {
  FlavorConfig(flavor: Flavor.QA,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(
          baseUrl: "https://raw.githubusercontent.com/JHBitencourt/ready_to_go/master/lib/json/person_qa.json"
      )
  );

  runApp(MyApp());
}