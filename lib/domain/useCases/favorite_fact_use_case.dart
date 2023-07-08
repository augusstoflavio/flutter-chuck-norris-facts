import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteFactUseCase {

  Future<Either<Failure, void>> call(Fact fact);
}