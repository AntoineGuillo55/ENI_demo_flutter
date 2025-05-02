import 'package:flutter/material.dart';
import 'cat.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bienvenue sur cette application"),
        ),
        body: LoadCat());
  }
}

class CatView extends StatelessWidget {
  Cat cat;

  CatView(this.cat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(cat.urlImage ?? "", width: cat.width, height: cat.height)
      ],
    );
  }
}

class LoadCat extends StatefulWidget {
  const LoadCat({super.key});

  @override
  State<LoadCat> createState() => _LoadCatState();
}

class _LoadCatState extends State<LoadCat> {
  Cat? cat;
  List<Cat> cats = [];

  void getCat() async {
    var response =
        await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search"));

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      setState(() {
        cat = Cat.fromJson(json[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(onPressed: getCat, child: Text("Get cat !")),
      if (cat != null)
        FutureBuilder<http.Response>(
            future: http.get(Uri.parse(
                "https://api.thecatapi.com/v1/images/search?limit=20")),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data?.body != null) {
                var json = convert.jsonDecode(snapshot.data!.body);
                cats = List<Cat>.from(json.map((data) => Cat.fromJson(data)));
                return Expanded(
                  child: ListView.builder(
                      itemCount: cats.length,
                      itemBuilder: (context, index) {
                    return CatView(cats[index]);
                  }),
                );
              }
              return CircularProgressIndicator();
            })
    ]);
  }
}
