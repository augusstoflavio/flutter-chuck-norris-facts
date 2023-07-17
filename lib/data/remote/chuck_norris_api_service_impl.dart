import 'package:chuck_norris_facts/data/remote/http_client.dart';
import 'package:chuck_norris_facts/data/remote/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/data/remote/response/search_facts_response.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

class ChuckNorrisApiServiceImpl extends ChuckNorrisApiService {
  final HttpClient httpClient;

  ChuckNorrisApiServiceImpl({required this.httpClient});

  @override
  Future<Either<Failure, SearchFactsResponse>> searchFacts(
    String search,
  ) async {
    return await httpClient.get("/jokes/search", {'query': search}, (result) {
      return SearchFactsResponse.fromJson(result);
    });
  }
}
