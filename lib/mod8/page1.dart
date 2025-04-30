import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page One")),
      body: Column(children: [
        Text(
          "Page One",
          style: TextStyle(fontSize: 56),
        ),
        ElevatedButton(onPressed: () {Navigator.pushNamed(context, "/page2", arguments: 456);}, child: Text("Go to page two !"))
      ]),
    );
  }
}
