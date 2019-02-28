import 'package:flutter/material.dart';
import 'package:ready_to_go/src/config/flavor_banner.dart';
import 'package:ready_to_go/src/config/flavor_config.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: Scaffold(
        appBar: AppBar(title: Text('Flutter Ready to Go')),
        body: Center(child: Text("Flavor: ${FlavorConfig.instance.name}")),
      ),
    );
  }

}