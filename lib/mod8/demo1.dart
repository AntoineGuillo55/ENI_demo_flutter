import 'package:flutter/material.dart';
import 'package:projects/mod8/page1.dart';
import 'package:projects/mod8/page2.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/page1",
      routes: Routes.getRoutes(context),
    );
  }
}

class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context){
    return {
      "/page1": (context) => PageOne(),
      "/page2": (context) => PageTwo(),
    };
  }
}

