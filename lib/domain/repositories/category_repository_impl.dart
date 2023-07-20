import 'package:chuck_norris_facts/domain/dataSources/category_local_data_source.dart';
import 'package:chuck_norris_facts/domain/dataSources/category_remote_data_source.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryLocalDataSource categoryLocalDataSource;
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepositoryImpl({
    required this.categoryLocalDataSource,
    required this.categoryRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<String>>> getOnlineCategories() async {
    return categoryRemoteDataSource.getCategories();
  }

  @override
  Future<Either<Failure, List<String>>> getRandomCategories(int limit) {
    return categoryLocalDataSource.getRandomCategories(limit);
  }

  @override
  Future<Either<Failure, void>> saveCategoriesLocally(
    List<String> categories,
  ) {
    return categoryLocalDataSource.saveCategories(categories);
  }
}
