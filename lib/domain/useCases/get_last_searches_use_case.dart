import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:dartz/dartz.dart';

abstract class GetLastSearchesUseCase {

  Future<Either<Failure, List<Search>>> call(int limit);
}