import 'package:chuck_norris_facts/domain/dataSources/fact_data_source.dart';
import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/repositories/fact_repository.dart';
import 'package:dartz/dartz.dart';

class FactRepositoryImpl extends FactRepository {
  final FactDataSource factDataSource;

  FactRepositoryImpl({required this.factDataSource});

  @override
  Future<Either<Failure, List<Fact>>> searchFacts(Search search) async {
    return factDataSource.searchFacts(search);
  }
}
