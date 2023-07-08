import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/useCases/favorite_fact_use_case.dart';
import 'package:dartz/dartz.dart';

class FavoriteFactUseCaseFake extends FavoriteFactUseCase {

  @override
  Future<Either<Failure, void>> call(String url) async {
    return const Right(null);
  }
}