import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "Demo widget de contenu"),
    );
  }
}

class AppHomePage extends StatelessWidget {
  String title;

  AppHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Column(
          children: [
            Text("Hello Michel !",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 36)),
            ElevatedButton(
              onPressed: () {},
              child: Text("Cliquez ici ! VITE !"),
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.amber)),
            ),
            OutlinedButton(onPressed: () {}, child: Text("Cliquez pas ici !")),
            FilledButton(onPressed: () {}, child: Text("DANGER")),
            Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/langfr-1920px-Google-flutter-logo.svg.png"),
            Image.asset("assets/images/will.jpg")
          ],
        ));
  }
}
