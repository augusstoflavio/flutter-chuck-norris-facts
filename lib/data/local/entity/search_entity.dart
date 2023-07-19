import 'package:floor/floor.dart';

@Entity(tableName: "search")
class SearchEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  const SearchEntity({
    this.id,
    required this.name,
  });
}