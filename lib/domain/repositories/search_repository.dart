import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, void>> saveSearch(Search search);
  Future<Either<Failure, List<Search>>> getLastSearches(int limit);
}