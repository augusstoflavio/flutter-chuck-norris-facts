import 'package:chuck_norris_facts/domain/dataSources/category_data_source.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDataSource categoryDataSource;

  CategoryRepositoryImpl({required this.categoryDataSource});

  @override
  Future<Either<Failure, List<String>>> getCategories(int limit) async {
    return categoryDataSource.getCategories(limit);
  }
}