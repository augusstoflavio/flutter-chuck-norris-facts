import 'package:chuck_norris_facts/data/extension/fact_response_extension.dart';
import 'package:chuck_norris_facts/data/remote/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/domain/dataSources/fact_data_source.dart';
import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:dartz/dartz.dart';

class FactDataSourceImpl extends FactDataSource {
  final ChuckNorrisApiService service;

  FactDataSourceImpl({required this.service});

  @override
  Future<Either<Failure, List<Fact>>> searchFacts(Search search) async {
    try {
      var response = await service.searchFacts(search.description);
      return Right(response.result.map((factResponse) {
        return factResponse.toFact();
      }).toList());
    } catch (e) {
      return Left(Failure());
    }
  }
}