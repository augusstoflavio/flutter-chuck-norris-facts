import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/useCases/get_last_searches_use_case.dart';
import 'package:dartz/dartz.dart';

class GetLastSearchesUseCaseFake extends GetLastSearchesUseCase {

  @override
  Future<Either<Failure, List<String>>> call(int limit) async {
    return const Right(["Flamengo", "Vasco"]);
  }

}