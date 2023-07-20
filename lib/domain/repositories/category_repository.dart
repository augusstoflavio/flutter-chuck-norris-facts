import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<String>>> getOnlineCategories();
  Future<Either<Failure, List<String>>> getRandomCategories(int limit);
  Future<Either<Failure, void>> saveCategoriesLocally(
      List<String> categories
  );
}