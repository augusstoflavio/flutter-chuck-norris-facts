import 'package:chuck_norris_facts/data/local/entity/category_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class CategoryDao {
  @Query('SELECT * FROM category ORDER BY RANDOM() LIMIT :limit')
  Future<List<CategoryEntity>> getRandomCategories(int limit);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveCategories(List<CategoryEntity> category);
}