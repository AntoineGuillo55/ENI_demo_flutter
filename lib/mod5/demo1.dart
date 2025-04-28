import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Layout",
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bienvenue sur cette application"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Alcool",
                  style:
                      TextStyle(color: Colors.pinkAccent.shade400, fontSize: 36)),
              SizedBox(height: 2500),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cigarette"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Poppers"),
                  Text("5€")
                ],
              ),
              FlexWidget()
            ],
          ),
        )
    );
  }
}

class FlexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("flex1"),
        Text("flex2")
      ],
    );
  }


}
