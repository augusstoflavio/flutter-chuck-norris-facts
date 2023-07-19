import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/repositories/search_repository.dart';
import 'package:chuck_norris_facts/domain/useCases/get_last_searches_use_case.dart';
import 'package:dartz/dartz.dart';

class GetLastSearchesUseCaseImpl extends GetLastSearchesUseCase {
  final SearchRepository searchRepository;

  GetLastSearchesUseCaseImpl({
    required this.searchRepository,
  });

  @override
  Future<Either<Failure, List<Search>>> call(int limit) async {
    return await searchRepository.getLastSearches(limit);
  }
}