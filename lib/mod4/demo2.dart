void main() {
  displayMessage("Salut", 5);
  displayMessage2("Coucou", number: 6);
  displayMessage2('Hola');
  displayMessage3(number: 2, message: getMessage("Bonsoir"));

}

void displayMessage(String message, int number) {

  for (int i = 0; i < number; i++) {
    print(message);

  }
}

void displayMessage2(String message, {int number = 1}) {

  for (int i = 0; i < number; i++) {
    print(message);

  }
}

displayMessage3({required String message, int number = 1}) {
  for (int i = 0; i < number; i++) {
    print(message);

  }
}

String getMessage(String message) {
  return message;

}