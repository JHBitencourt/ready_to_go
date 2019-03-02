import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ready_to_go/src/config/flavor_config.dart';
import 'package:http/http.dart' as http;

class BaseApi {

  static const int TIMEOUT_SECONDS = 5;
  final String baseUrl = FlavorConfig.instance.values.baseUrl;

  Future<dynamic> get(String url) async {
    final response = await http.get(url)
        .timeout(const Duration(seconds: TIMEOUT_SECONDS), onTimeout: _onTimeout);
    final responseJson = json.decode(response.body);

    return responseJson;
  }

  Future<http.Response> _onTimeout() {
    throw new SocketException("Timeout during request");
  }

}