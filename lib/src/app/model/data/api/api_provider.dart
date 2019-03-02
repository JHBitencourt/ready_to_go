import 'dart:convert';

import 'package:ready_to_go/json/person_dev.dart';
import 'package:ready_to_go/src/app/model/bean/person.dart';
import 'package:ready_to_go/src/app/model/data/api/base_api.dart';
import 'package:ready_to_go/src/config/flavor_config.dart';


class ApiProvider extends BaseApi {

  Future<Person> fetchData() async {
    var responseJson;
    if(FlavorConfig.isDevelopment()) {
      responseJson = json.decode(PersonJson.getJson());
      await new Future.delayed(new Duration(seconds: 2));
    } else {
      String url = "${baseUrl}";
      responseJson = await get(url);
    }

    return Person.fromJson(responseJson['person']);
  }

}