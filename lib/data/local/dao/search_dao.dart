import 'package:chuck_norris_facts/data/local/entity/search_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class SearchDao {
  @Query('SELECT * FROM search GROUP BY name ORDER BY max(id) DESC LIMIT :limit')
  Future<List<SearchEntity>> getLastSearches(int limit);

  @insert
  Future<void> saveSearch(SearchEntity search);
}