import 'package:chuck_norris_facts/data/local/dao/search_dao.dart';
import 'package:chuck_norris_facts/domain/dataSources/search_data_source.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/generic_failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/data/local/entity/search_entity.dart';
import 'package:dartz/dartz.dart';

class SearchDataSourceImpl extends SearchDataSource {
  final SearchDao searchDao;

  SearchDataSourceImpl({
    required this.searchDao,
  });

  @override
  Future<Either<Failure, List<Search>>> getLastSearches(int limit) async {
    try {
      var lastSearches = await searchDao.getLastSearches(limit);
      return Right(lastSearches.map((e) {
        return Search(description: e.name);
      }).toList());
    } catch (e) {
      return Left(GenericFailure(exception: e as Exception));
    }
  }

  @override
  Future<Either<Failure, void>> saveSearch(Search search) async {
    try {
      await searchDao.saveSearch(
        SearchEntity(name: search.description)
      );
      return const Right(null);
    } catch (e) {
      return Left(GenericFailure(exception: e as Exception));
    }
  }
}
