import 'dart:io';
import 'dart:math';

void main() {
  List<int> userNumbers = getUniqueUserNumbers();
  List<int> generatedNumbers = generateRandomNumbers();

  userNumbers.sort();
  generatedNumbers.sort();

  print("Seu jogo da Mega Sena: $userNumbers");
  print("Jogo gerado: $generatedNumbers");

  List<int> matchingNumbers =
      userNumbers.where((number) => generatedNumbers.contains(number)).toList();
  print("Números que você acertou: $matchingNumbers");
}

List<int> getUniqueUserNumbers() {
  List<int> userNumbers = [];
  print("Digite 6 números da Mega Sena (de 1 a 60):");

  while (userNumbers.length < 6) {
    int? number = int.tryParse(stdin.readLineSync()!);
    if (number != null &&
        number >= 1 &&
        number <= 60 &&
        !userNumbers.contains(number)) {
      userNumbers.add(number);
    } else {
      print("Número inválido ou repetido. Digite novamente.");
    }
  }
  return userNumbers;
}

List<int> generateRandomNumbers() {
  List<int> generatedNumbers = [];
  final random = Random();

  while (generatedNumbers.length < 6) {
    int number = random.nextInt(60) + 1;
    if (!generatedNumbers.contains(number)) {
      generatedNumbers.add(number);
    }
  }
  return generatedNumbers;
}
