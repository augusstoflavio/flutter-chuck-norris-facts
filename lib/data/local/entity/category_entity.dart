import 'package:floor/floor.dart';

@Entity(tableName: "category")
class CategoryEntity {
  @primaryKey
  final String name;

  const CategoryEntity({
    required this.name,
  });
}