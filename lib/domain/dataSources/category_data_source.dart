import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryDataSource {
  Future<Either<Failure, List<String>>> getCategories(int limit);
}