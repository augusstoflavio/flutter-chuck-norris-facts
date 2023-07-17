import 'package:chuck_norris_facts/data/remote/response/search_facts_response.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChuckNorrisApiService {

  Future<Either<Failure, SearchFactsResponse>> searchFacts(String search);
}