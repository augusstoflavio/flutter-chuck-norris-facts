import 'package:chuck_norris_facts/data/remote/response/search_facts_response.dart';

abstract class ChuckNorrisApiService {

  Future<SearchFactsResponse> searchFacts(String url);
}