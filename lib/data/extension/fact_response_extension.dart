import 'package:chuck_norris_facts/data/remote/response/search_facts_result_response.dart';
import 'package:chuck_norris_facts/domain/models/fact.dart';

extension SearchFactsResultResponseExtension on SearchFactsResultResponse {
  Fact toFact() {
    return Fact(
      description: value,
      url: url,
      isFavorite: false,
      categories: categories,
    );
  }
}
