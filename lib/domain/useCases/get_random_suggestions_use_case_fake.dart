import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/useCases/get_random_suggestions_use_case.dart';
import 'package:dartz/dartz.dart';

class GetRandomSuggestionsUseCaseFake extends GetRandomSuggestionsUseCase {
  @override
  Future<Either<Failure, List<String>>> call(int limit) async {
    return const Right(["Politica", "Filmes", "Novelas"]);
  }

}