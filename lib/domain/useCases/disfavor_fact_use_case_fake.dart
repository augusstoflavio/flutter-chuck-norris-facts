import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/useCases/disfavor_fact_use_case.dart';
import 'package:dartz/dartz.dart';

class DisfavorFactUseCaseFake extends DisfavorFactUseCase {

  @override
  Future<Either<Failure, void>> call(Fact fact) async {
    return const Right(null);
  }
}