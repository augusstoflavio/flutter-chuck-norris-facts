import 'package:chuck_norris_facts/data/remote/response/search_facts_result_response.dart';

class SearchFactsResponse {
  final List<SearchFactsResultResponse> result;

  SearchFactsResponse({
    required this.result,
  });

  SearchFactsResponse.fromJson(Map<String, dynamic> json)
      : result = (json['result'] as List<dynamic>)
      .map((data) => SearchFactsResultResponse.fromJson(data))
      .toList();
}
