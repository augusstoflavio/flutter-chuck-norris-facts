import 'dart:ffi';

class Fact {
  late final String description;
  late final String url;
  late final bool isFavorite;
  late final List<String> categories;

  Fact(
      {
        required this.description,
        required this.url,
        required this.isFavorite,
        required this.categories
      }
  );
}
