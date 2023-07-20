import 'package:chuck_norris_facts/data/local/dao/category_dao.dart';
import 'package:chuck_norris_facts/data/local/entity/category_entity.dart';
import 'package:chuck_norris_facts/domain/dataSources/category_local_data_source.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

class CategoryLocalDataSourceImpl extends CategoryLocalDataSource {
  final CategoryDao categoryDao;

  CategoryLocalDataSourceImpl({required this.categoryDao});

  @override
  Future<Either<Failure, List<String>>> getRandomCategories(int limit) async {
    var result = await categoryDao.getRandomCategories(limit);
    var categories = result.map((categoryEntity) {
      return categoryEntity.name;
    }).toList();
    return Right(categories);
  }

  @override
  Future<Either<Failure, void>> saveCategories(List<String> categories) async {
    var categoryEntities = categories
        .map(
          (category) => CategoryEntity(name: category),
        )
        .toList();
    await categoryDao.saveCategories(categoryEntities);
    return const Right(null);
  }
}
