import 'package:flutter/material.dart';
import 'package:flutterhack/boelens_bloc_provider.dart';
import 'package:flutterhack/detail_bloc.dart';
import 'package:flutterhack/detail_page.dart';
import 'babynames.dart';

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
   if( settings.name == '/detail') {
     final bloc = DetailBloc(resourceId: 'p6mNorotnbnWwImJBLXM');
     return MaterialPageRoute(
       settings:settings,
       builder: (BuildContext context) {
         return BoelensBlocProvider<DetailBloc>(
           bloc: bloc,
           child: DetailPage(),
         );
       }
     );
   }

   return MaterialPageRoute(
     settings:settings,
     builder: (BuildContext context) {
       return BabyNamesPage();
     }
   );
 }

}
