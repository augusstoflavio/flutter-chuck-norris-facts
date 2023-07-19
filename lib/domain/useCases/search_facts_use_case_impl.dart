import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/repositories/fact_repository.dart';
import 'package:chuck_norris_facts/domain/repositories/search_repository.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case.dart';
import 'package:dartz/dartz.dart';

class SearchFactsUseCaseImpl extends SearchFactsUseCase {
  final FactRepository factRepository;
  final SearchRepository searchRepository;

  SearchFactsUseCaseImpl({
    required this.factRepository,
    required this.searchRepository,
  });

  @override
  Future<Either<Failure, List<Fact>>> call(Search search) async {
    var saveSearchResult = await searchRepository.saveSearch(search);
    saveSearchResult.fold(
      (l) {
        return l;
      },
      (r) {
        // nothing to do
      }
    );

    return factRepository.searchFacts(search);
  }
}
