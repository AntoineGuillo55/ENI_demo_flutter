
void main () {

  // typage classique
  String hello = "Hello world !";
  print(hello);

  //   typage optionnel
  var name = "Michel";
  // name = 123
  name= "Sylvain";

  const age = 25;

  String? city;

  print(city?.toUpperCase());
}