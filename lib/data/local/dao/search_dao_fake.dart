import 'package:chuck_norris_facts/data/local/dao/search_dao.dart';
import 'package:chuck_norris_facts/data/local/entity/search_entity.dart';

class SearchDaoFake extends SearchDao {

  @override
  Future<List<SearchEntity>> getLastSearches(int limit) async {
    return [];
  }

  @override
  Future<void> saveSearch(SearchEntity search) async {
    return;
  }
  
}