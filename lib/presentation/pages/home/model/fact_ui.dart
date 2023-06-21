class FactUi {
  final String description;
  final String category;
  final bool isLarge;
  final bool isFavorite;

  const FactUi({
    required this.description,
    required this.category,
    required this.isLarge,
    required this.isFavorite,
  });

  FactUi copyWith({
    String? description,
    String? category,
    bool? isLarge,
    bool? isFavorite
  }) {
    return FactUi(
      description: description ?? this.description,
      category: category ?? this.category,
      isLarge: isLarge ?? this.isLarge,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}