import 'package:flutter/material.dart';
import 'babynames.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Learn Flutter Tool',
     home: BabyNamesPage(),
   );
 }
}
