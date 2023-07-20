import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRemoteDataSource {
  Future<Either<Failure, List<String>>> getCategories();
}