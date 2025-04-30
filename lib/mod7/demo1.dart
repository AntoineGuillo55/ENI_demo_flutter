import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "Demo Formulaire"),
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
        body: DemoForm());
  }
}

class DemoForm extends StatefulWidget {
  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {

  bool isOk = false;
  String trueRadio = "true";
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String name = "", age = "", sport = "";

  // var nameController = TextEditingController();

  void updateRadioValue(String? value) {
    setState(() {
      trueRadio = value!;
    });
  }

  String? validateName(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer un nom';
    }
    if (value.length < 3) {
      return 'Le nom doit contenir au moins 3 caractères';
    }
    return null;
  }

  String? validateAge(value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un prénom';
    }
    return null;
  }

  String? validateSport(value) {
    if (value == null) {
      return 'Veuillez choisir un sport';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                // controller: nameController,
                onSaved: (value) {
                  name = value!;
                },
                validator: validateName,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  hintText: 'Entrez votre nom',
                ),
              ),
              TextFormField(
                  onSaved: (value) {
                    age = value!;
                  },
                  validator: validateAge,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  decoration: InputDecoration(
                    labelText: 'Age',
                    hintText: 'Entrez votre age',
                  )),
              DropdownButtonFormField(
                  onSaved: (value) {
                    sport = value!;
                  },
                  validator: validateSport,
                  items: [
                    DropdownMenuItem(
                        child: Text("-Choisir un sport-"), value: null),
                    DropdownMenuItem(child: Text("Curling"), value: "curling"),
                    DropdownMenuItem(
                        child: Text("Air Poney"), value: "airponey"),
                    DropdownMenuItem(
                        child: Text("Quidditch"), value: "quidditch"),
                    DropdownMenuItem(
                        child: Text("Disco foot"), value: "discofoot"),
                  ],
                  onChanged: (value) {}),
              Row(
                children: [
                  Checkbox(
                      value: isOk,
                      onChanged: (checked) {
                        setState(() {
                          isOk = checked!;
                        });
                      }),
                  Text("La <form> ?")
                ],
              ),
              Row(
                children: [
                  Text("Vrai"),
                  Radio<String>(
                      value: "true",
                      groupValue: trueRadio,
                      onChanged: updateRadioValue),
                  Text("Faux"),
                  Radio<String>(
                      value: "false",
                      groupValue: trueRadio,
                      onChanged: updateRadioValue),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    // On déclenche les validations
                    if (_keyForm.currentState!.validate()) {
                      // On déclenche la sauvegarde des données
                      _keyForm.currentState!.save();
                      print(name);
                      print(age);
                      print(sport);
                      print(trueRadio);
                    }
                  },
                  child: Text("Valider"))
            ],
          ),
        ));
    throw UnimplementedError();
  }
}
