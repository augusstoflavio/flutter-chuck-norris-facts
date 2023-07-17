import 'package:chuck_norris_facts/data/remote/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/domain/dataSources/category_data_source.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

class CategoryDataSourceImpl extends CategoryDataSource {

  final ChuckNorrisApiService chuckNorrisApiService;

  CategoryDataSourceImpl({required this.chuckNorrisApiService});

  @override
  Future<Either<Failure, List<String>>> getCategories(int limit) async {
    return chuckNorrisApiService.getCategories();
  }

}