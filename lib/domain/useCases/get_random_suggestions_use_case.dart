import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class GetRandomSuggestionsUseCase {

  Future<Either<Failure, List<String>>> call(int limit);
}