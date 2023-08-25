void main(List<String> arguments) {
  var portugues = {'Brasil', 'Portugal'};
  var europa = {'Alemanha', 'Portugal', 'Espanha'};

  var paisesPortuguesEuropa = portugues.intersection(europa);
  print('Países onde se fala português e todos países da Europa:');
  paisesPortuguesEuropa.forEach((pais) => print(pais));
  print('\n');

  var paisesPortuguesEuropeus =
      portugues.where((pais) => europa.contains(pais)).toList();
  print('Países europeus onde se fala português:');
  paisesPortuguesEuropeus.forEach((pais) => print(pais));
  print('\n');

  var paisesPortuguesNaoEuropeus =
      portugues.where((pais) => !europa.contains(pais)).toList();
  print('Países onde se fala português e que não são europeus:');
  paisesPortuguesNaoEuropeus.forEach((pais) => print(pais));
  print('\n');

  var outrosPaises = europa.where((pais) => !portugues.contains(pais)).toList();
  print(
      'Todos os países exceto aqueles em que se fala português e que são europeus:');
  outrosPaises.forEach((pais) => print(pais));
}
