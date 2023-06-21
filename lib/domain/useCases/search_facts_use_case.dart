import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:dartz/dartz.dart';

abstract class SearchFactsUseCase {

  Future<Either<Failure, List<Fact>>> call(Search search);
}