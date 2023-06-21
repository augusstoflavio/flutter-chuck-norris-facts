import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/repositories/fact_repository.dart';
import 'package:dartz/dartz.dart';

import '../models/failure.dart';

class FactRepositoryImpl extends FactRepository {

  @override
  Future<Either<Failure, List<Fact>>> searchFacts(Search search) {
    // TODO: implement searchFacts
    throw UnimplementedError();
  }
}