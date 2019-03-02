import 'package:flutter/material.dart';
import 'package:ready_to_go/src/app/bloc/bloc_provider.dart';
import 'package:ready_to_go/src/app/bloc/home_bloc.dart';
import 'package:ready_to_go/src/app/ui/pages/home_page.dart';
import 'package:ready_to_go/src/config/flavor_banner.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      bloc: HomeBloc(),
      child: MaterialApp(
        title: 'Ready to Go',
        onGenerateRoute: _routes,
      ),
    );
  }

  Route _routes(RouteSettings settings) {
    if (settings.isInitialRoute)
      return MaterialPageRoute(
          builder: (context) {
            var homePage = HomePage();

            final homebloc = BlocProvider.of<HomeBloc>(context);
            homebloc.fetchData();

            return FlavorBanner(
              child: homePage,
            );
          }
      );
  }

}