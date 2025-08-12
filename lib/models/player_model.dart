class Player {
  final String name;
  final int number;
  final String position;
  final String? image;

  Player({
    required this.name,
    required this.number,
    required this.position,
    this.image,
  });
}
