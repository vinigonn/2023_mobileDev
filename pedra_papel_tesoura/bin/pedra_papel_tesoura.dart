//importar pacote para geração de valores aleatórios
//importar pacote para captura de dados da entrada padrão
//criar um enum que representa as 4 opções do jogo, abaixo:
//pedra, papel, tesoura, sair
import 'dart:async';
import 'dart:io';
import 'dart:math';

enum Move { papel, tesoura, pedra }

void main() {
  int userScore = 0;
  int computerScore = 0;
  final random = Random();

  print("Bem-vindo ao Pedra, Papel e Tesoura!");

  for (int round = 1; round <= 3; round++) {
    print("\nRodada $round:");

    printMenu();
    int userChoice = getUserChoice();

    if (userChoice == 4) {
      print("Você saiu do jogo.");
      break;
    }

    Move userMove = getMove(userChoice);
    Move computerMove = getMove(random.nextInt(3) + 1);

    print("Você escolheu: ${moveToString(userMove)}");
    print("Computador escolheu: ${moveToString(computerMove)}");

    var result = whoWon(userMove, computerMove);
    if (result == 0) {
      print("Empate!");
    } else if (result == 1) {
      print("Você venceu esta rodada!");
      userScore++;
    } else {
      print("Computador venceu esta rodada.");
      computerScore++;
    }

    Timer(Duration(seconds: 3), () {});
  }

  print("\nResultados finais:");
  print("Você: $userScore vitórias");
  print("Computador: $computerScore vitórias");
  print("**************************");
}

void printMenu() {
  print("Escolha uma opção:");
  print("1. Papel");
  print("2. Tesoura");
  print("3. Pedra");
  print("4. Sair");
}

int getUserChoice() {
  int? choice;
  while (true) {
    String? input = stdin.readLineSync();
    choice = int.tryParse(input!);
    if (choice != null && choice >= 1 && choice <= 4) {
      break;
    } else {
      print("Opção inválida. Por favor, escolha novamente.");
    }
  }
  return choice;
}

Move getMove(int choice) {
  return Move.values[choice - 1];
}

String moveToString(Move move) {
  switch (move) {
    case Move.papel:
      return "Papel";
    case Move.tesoura:
      return "Tesoura";
    case Move.pedra:
      return "Pedra";
    default:
      return "";
  }
}

int whoWon(Move userMove, Move computerMove) {
  if (userMove == computerMove) {
    return 0; // Empate
  } else if ((userMove == Move.papel && computerMove == Move.pedra) ||
      (userMove == Move.tesoura && computerMove == Move.papel) ||
      (userMove == Move.pedra && computerMove == Move.tesoura)) {
    return 1; // Usuário vence
  } else {
    return -1; // Computador vence
  }
}
