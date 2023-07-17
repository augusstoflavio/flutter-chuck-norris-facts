import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';
import 'package:chuck_norris_facts/domain/useCases/get_random_suggestions_use_case.dart';
import 'package:dartz/dartz.dart';

class GetRandomSuggestionsUseCaseImpl extends GetRandomSuggestionsUseCase {
  final CategoryRepository categoryRepository;

  GetRandomSuggestionsUseCaseImpl({required this.categoryRepository});

  @override
  Future<Either<Failure, List<String>>> call(int limit) {
    return categoryRepository.getCategories(limit);
  }
}