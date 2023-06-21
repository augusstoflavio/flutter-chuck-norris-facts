import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:dartz/dartz.dart';

import '../models/failure.dart';

abstract class FactDataSource {
  Future<Either<Failure, List<Fact>>> searchFacts(Search search);
}