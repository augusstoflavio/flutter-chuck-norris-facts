import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/presentation/pages/home/model/fact_ui.dart';

extension FactExtension on Fact {
  FactUi toFactUi() {
    return FactUi(
        description: description,
        category: categories.firstOrNull ?? "uncategorized",
        url: url,
        isLarge: description.length < 80,
        isFavorite: isFavorite
    );
  }
}