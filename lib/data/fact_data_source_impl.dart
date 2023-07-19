import 'package:chuck_norris_facts/data/remote/extension/fact_response_extension.dart';
import 'package:chuck_norris_facts/data/remote/service/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/domain/dataSources/fact_data_source.dart';
import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:dartz/dartz.dart';

class FactDataSourceImpl extends FactDataSource {
  final ChuckNorrisApiService chuckNorrisApiService;

  FactDataSourceImpl({required this.chuckNorrisApiService});

  @override
  Future<Either<Failure, List<Fact>>> searchFacts(Search search) async {
    var searchFactsResponse = await chuckNorrisApiService.searchFacts(
      search.description,
    );
    return searchFactsResponse.map(
      (searchFactResponse) {
        return searchFactResponse.result.map(
          (searchFactResultResponse) {
            return searchFactResultResponse.toFact();
          },
        ).toList();
      },
    );
  }
}
