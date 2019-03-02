

import 'package:ready_to_go/src/app/model/bean/person.dart';
import 'package:ready_to_go/src/app/model/data/api/api_provider.dart';

class Repository {

  static Repository _instance = new Repository.internal();
  Repository.internal();

  factory Repository() => _instance;

  final ApiProvider _api = new ApiProvider();

  Future<Person> fetchData() async {
    return _api.fetchData();
  }

}