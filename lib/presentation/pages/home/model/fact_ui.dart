class FactUi {
  final String description;
  final String category;
  final String url;
  final bool isLarge;
  final bool isFavorite;

  const FactUi({
    required this.description,
    required this.category,
    required this.url,
    required this.isLarge,
    required this.isFavorite,
  });

  FactUi copyWith({
    String? description,
    String? category,
    String? url,
    bool? isLarge,
    bool? isFavorite
  }) {
    return FactUi(
      description: description ?? this.description,
      category: category ?? this.category,
      url: url ?? this.url,
      isLarge: isLarge ?? this.isLarge,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}