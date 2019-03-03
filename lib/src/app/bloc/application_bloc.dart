import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:ready_to_go/src/app/bloc/bloc_provider.dart';
import 'package:ready_to_go/src/app/model/core/connectivity_handler.dart';

class ApplicationBloc implements BlocBase {

  final List<ConnectivityHandler> _delegates = List();
  StreamSubscription<ConnectivityResult> _connectivity;

  ConnectivityResult _currentConnectivity;

  ApplicationBloc() {
    _init();
  }

  void _init() {
    _connectivity =  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(_currentConnectivity != null) {
        for (var delegate in _delegates) {
          delegate.onConnectivityChanged(result);
        }
      }

      _currentConnectivity = result;
    });
  }

  void listenConnectivity(ConnectivityHandler handler) => _delegates.add(handler);
  ConnectivityResult get currentConnectivity => _currentConnectivity;

  @override
  void dispose() {
    _connectivity.cancel();
  }
}
