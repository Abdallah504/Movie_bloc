import 'package:flutter/material.dart';
import 'package:movie_bloc/routing.dart';

void main() {
  runApp( MyApp(routing: Routing(),));
}

class MyApp extends StatelessWidget {
  final Routing routing;

  const MyApp({super.key, required this.routing});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:routing.generateRoute ,
    );
  }
}

