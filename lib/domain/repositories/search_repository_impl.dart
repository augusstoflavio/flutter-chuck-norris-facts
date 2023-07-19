import 'package:chuck_norris_facts/domain/dataSources/search_data_source.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchDataSource searchDataSource;

  SearchRepositoryImpl({
    required this.searchDataSource,
  });

  @override
  Future<Either<Failure, List<Search>>> getLastSearches(int limit) {
    return searchDataSource.getLastSearches(limit);
  }

  @override
  Future<Either<Failure, void>> saveSearch(Search search) {
    return searchDataSource.saveSearch(search);
  }
}