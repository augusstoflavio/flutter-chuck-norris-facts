import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryLocalDataSource {
  Future<Either<Failure, List<String>>> getRandomCategories(int limit);
  Future<Either<Failure, void>> saveCategories(List<String> categories);
}