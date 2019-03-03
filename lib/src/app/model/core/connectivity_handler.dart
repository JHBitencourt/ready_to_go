import 'package:connectivity/connectivity.dart';

abstract class ConnectivityHandler {

  void onError(String error);
  void onConnectivityChanged(ConnectivityResult connectivity);

}