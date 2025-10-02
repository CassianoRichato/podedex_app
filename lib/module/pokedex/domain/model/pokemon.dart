class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  bool isFavorite;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });

  String get displayName => name[0].toUpperCase() + name.substring(1);
}
