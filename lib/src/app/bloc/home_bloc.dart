import 'dart:async';

import 'package:ready_to_go/src/app/bloc/bloc_provider.dart';
import 'package:ready_to_go/src/app/model/bean/person.dart';
import 'package:ready_to_go/src/app/model/core/connectivity_handler.dart';
import 'package:ready_to_go/src/app/model/data/repository.dart';

class HomeBloc implements BlocBase {

  final Repository _repository = Repository();
  bool _dataLoaded = false;

  final StreamController<Person> _personController = new StreamController<Person>();

  Stream<Person> get personStream => _personController.stream;
  bool get dataLoaded => _dataLoaded;

  void fetchData(ConnectivityHandler delegate) async {
    try {
      final person = await _repository.fetchData();
      _dataLoaded = true;
      _personController.sink.add(person);
    } catch(e) {
      delegate.onError(e.toString());
    }
  }

  @override
  void dispose() {
    _personController.close();
  }
}
