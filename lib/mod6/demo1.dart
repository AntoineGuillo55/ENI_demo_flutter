import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "Demo Password"),
    );
  }
}

class AppHomePage extends StatelessWidget {
  String title;

  AppHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: PasswordWidget(label: 'Password',));
  }
}


class PasswordWidget extends StatefulWidget{

  String label;

  PasswordWidget({super.key, required this.label});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {

  bool isVisible = false;

  void toggleVisibility(bool value) {
    setState(() {
      isVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: !isVisible,
          decoration: InputDecoration(label: Text(widget.label)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isVisible ? Icons.lock_open : Icons.lock_outline),
            Switch(value: isVisible, onChanged: toggleVisibility)
          ],
        )
      ],
    );
  }
}