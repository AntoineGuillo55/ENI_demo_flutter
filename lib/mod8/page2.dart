import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});


  // Récupération
  @override
  Widget build(BuildContext context) {

    int? number = ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Column(
        children: [
          Text("Page 2", style: TextStyle(fontSize: 56)),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back $number" ))
        ],
      ),
    );
  }
}

