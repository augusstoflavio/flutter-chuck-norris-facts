import 'package:chuck_norris_facts/data/remote/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/data/remote/response/search_facts_response.dart';
import 'package:dio/dio.dart';

class ChuckNorrisApiServiceImpl extends ChuckNorrisApiService {

  final Dio dio;

  ChuckNorrisApiServiceImpl({
    required this.dio,
  });

  @override
  Future<SearchFactsResponse> searchFacts(String search) async {
    var result = await dio.get(
        "/jokes/search",
        queryParameters: {'query': search},
    );
    return SearchFactsResponse.fromJson(result.data);
  }
}