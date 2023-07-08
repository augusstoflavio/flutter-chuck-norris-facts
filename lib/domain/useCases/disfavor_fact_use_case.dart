import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class DisfavorFactUseCase {

  Future<Either<Failure, void>> call(String url);
}