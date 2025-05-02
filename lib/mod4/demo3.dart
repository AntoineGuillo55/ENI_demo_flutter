enum CartoonType { Comedy, Drama, Dummy, Horror }

class Cartoon {
  String name = "";
  int duration = 0;
  CartoonType type = CartoonType.Comedy;

  Cartoon(
      {required this.name,
      required this.duration,
      this.type = CartoonType.Comedy});

  Cartoon.fromJSON(Map<String, dynamic> json) {
    name = json['name'];
    duration = json['duration'];
    type = CartoonType.Comedy;
  }

  @override
  String toString() {
    return 'Cartoon{name: $name, duration: $duration, type: $type}';
  }

  set setDuration(int duration) {
    this.duration = duration;
  }

  int get getDuration {
    return duration;
  }
}

void main() {
  Cartoon shrek = Cartoon(name: "Shrek", duration: 120);
  print(shrek);
  shrek.setDuration = 100;
  print(shrek.getDuration);

  Cartoon mulan = Cartoon.fromJSON({'name': 'Mulan', 'duration': 100, 'type': CartoonType.Drama});
  print(mulan);
}
