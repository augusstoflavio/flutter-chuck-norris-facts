import 'package:chuck_norris_facts/data/remote/service/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/domain/dataSources/category_remote_data_source.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final ChuckNorrisApiService chuckNorrisApiService;

  CategoryRemoteDataSourceImpl({
    required this.chuckNorrisApiService,
  });

  @override
  Future<Either<Failure, List<String>>> getCategories() {
    return chuckNorrisApiService.getCategories();
  }
}