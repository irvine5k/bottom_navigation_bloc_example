import 'package:flutter/material.dart';
import 'package:navigation_bloc/src/pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation BLoC Example',
      home: RootPage(),
    );
  }
}
