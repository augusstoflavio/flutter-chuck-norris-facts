import 'package:chuck_norris_facts/data/remote/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/repositories/fact_repository.dart';
import 'package:dartz/dartz.dart';

import '../models/failure.dart';

class FactRepositoryImpl extends FactRepository {
  final ChuckNorrisApiService service;

  FactRepositoryImpl({required this.service});

  @override
  Future<Either<Failure, List<Fact>>> searchFacts(Search search) async {
    try {
      var response = await service.searchFacts(search.description);
      var a = response.result.map((factResponse) {
        return Fact(
            description: factResponse.value,
            url: factResponse.url,
            isFavorite: false,
            categories: factResponse.categories);
      }).toList();
      return Right(a);
    } catch(e) {
      return Left(Failure());
    }
  }
}
