import 'package:flutter/material.dart';
import 'package:flutterhack/data/boelens_bloc_provider.dart';
import 'package:flutterhack/data/detail_bloc.dart';
import 'package:flutterhack/screens/add_review.dart';
import 'package:flutterhack/screens/detail_page.dart';
import 'package:flutterhack/screens/resources_list.dart';
import 'package:flutterhack/screens/review_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter Tool',
      onGenerateRoute: _getRoute,
      initialRoute: '/detail',
      //home: BabyNamesPage(),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/detail') {
      final bloc = DetailBloc(resourceId: 'p6mNorotnbnWwImJBLXM');
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return BoelensBlocProvider<DetailBloc>(
              bloc: bloc,
              child: DetailPage(),
            );
          });
    }

    if (settings.name == '/reviewlist') {
      final bloc = DetailBloc(resourceId: 'p6mNorotnbnWwImJBLXM');
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return BoelensBlocProvider<DetailBloc>(
              bloc: bloc,
              child: ReviewListPage(),
            );
          });
    }

    if (settings.name == '/addreview') {
      // final bloc = DetailBloc(resourceId: 'p6mNorotnbnWwImJBLXM');
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return AddReviewPage();
            // return BoelensBlocProvider<DetailBloc>(
            //   bloc: bloc,
            //   child: ReviewListPage(),
            // );
          });
    }

    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return ResourcesListPage();
        });
  }
}
