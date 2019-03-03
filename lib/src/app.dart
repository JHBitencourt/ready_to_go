import 'package:flutter/material.dart';
import 'package:ready_to_go/src/app/bloc/application_bloc.dart';
import 'package:ready_to_go/src/app/bloc/bloc_provider.dart';
import 'package:ready_to_go/src/app/bloc/home_bloc.dart';
import 'package:ready_to_go/src/app/ui/pages/home_page.dart';
import 'package:ready_to_go/src/config/flavor_banner.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
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
            final homePage = HomePage();

            final applicationBloc = BlocProvider.of<ApplicationBloc>(context);
            applicationBloc.listenConnectivity(homePage);

            final homebloc = HomeBloc();
            homebloc.fetchData(homePage);

            return BlocProvider<HomeBloc>(
              bloc: homebloc,
              child: FlavorBanner(
                child: homePage,
              ),
            );
          }
      );
  }

}