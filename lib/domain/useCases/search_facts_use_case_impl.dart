import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/repositories/fact_repository.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case.dart';
import 'package:dartz/dartz.dart';

class SearchFactsUseCaseImpl extends SearchFactsUseCase {
  final FactRepository factRepository;

  SearchFactsUseCaseImpl({required this.factRepository});

  @override
  Future<Either<Failure, List<Fact>>> call(Search search) {
    return factRepository.searchFacts(search);
  }
}