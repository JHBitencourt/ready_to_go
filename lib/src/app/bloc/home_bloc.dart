import 'dart:async';

import 'package:ready_to_go/src/app/bloc/bloc_provider.dart';
import 'package:ready_to_go/src/app/model/bean/person.dart';
import 'package:ready_to_go/src/app/model/data/repository.dart';

class HomeBloc implements BlocBase {

  final Repository _repository = Repository();
  bool _dataLoaded = false;

  final StreamController<Person> _personController = new StreamController<Person>();

  Stream<Person> get personStream => _personController.stream;
  bool get dataLoaded => _dataLoaded;

  void fetchData() async {
    try {
      final person = await _repository.fetchData();
      _personController.sink.add(person);
    } catch(e) {
      print("Temporarily printing errors " + e);
    }
  }

  @override
  void dispose() {
    _personController.close();
  }
}
