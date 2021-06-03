enum Gender {
  male,
  female,
}

class Player {
  final String name;
  final Gender gender;

  Player({required this.name, required this.gender});
}
