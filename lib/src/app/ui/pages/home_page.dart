import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:ready_to_go/src/app/bloc/bloc_provider.dart';
import 'package:ready_to_go/src/app/bloc/home_bloc.dart';
import 'package:ready_to_go/src/app/model/bean/person.dart';
import 'package:ready_to_go/src/app/model/core/connectivity_handler.dart';

class HomePage extends StatelessWidget implements ConnectivityHandler {

  final _keyScaffold = new GlobalKey<ScaffoldState>();
  HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(title: Text('Flutter Ready to Go')),
      body: StreamBuilder(
          stream: _bloc.personStream,
          builder: (context, AsyncSnapshot<Person> snapshot) {
            if(!snapshot.hasData) return Center(child: CircularProgressIndicator());

            final person = snapshot.data;
            return _buildPersonInfo(person);
          }
      ),
    );
  }

  Widget _buildPersonInfo(Person person) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildText("Api URL: ${person.apiUrl}", 22.0)
          ],
        ),
        _buildText("Name: ${person.name} ${person.lastName}", 16.0),
        _buildText("Github: ${person.github}", 16.0),
        _buildText("Twitter: ${person.twitter}", 16.0),
        _buildText("Website: ${person.website}", 16.0),
      ],
    );
  }

  Widget _buildText(String text, double fontSize) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
      child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              fontSize: fontSize
          )
      ),
    );
  }

  @override
  void onConnectivityChanged(ConnectivityResult connectivity) {
    showSnackBar("Connectivity changed to ${connectivity}");

    if (!_bloc.dataLoaded && (connectivity == ConnectivityResult.wifi ||
        connectivity == ConnectivityResult.mobile)) {
      _bloc.fetchData(this);
    }
  }

  @override
  void onError(String error) {
    showSnackBar(error);
  }

  void showSnackBar(String text, [int time = 2000]){
    final snackbar = new SnackBar(
      content: new Text(text),
      duration: Duration(milliseconds: time),
    );
    _keyScaffold?.currentState.showSnackBar(snackbar);
  }

}