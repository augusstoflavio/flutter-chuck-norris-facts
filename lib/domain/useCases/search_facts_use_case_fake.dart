import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case.dart';
import 'package:dartz/dartz.dart';

class SearchFactsUseCaseFake extends SearchFactsUseCase {

  @override
  Future<Either<Failure, List<Fact>>> call(Search search) async {
    var facts = [
      Fact(
          description: "Combined with a handful of model sentence structures",
          url: "https://url.com.br",
          categories: ["Flamengo", "Vasco"],
          isFavorite: true
      ),
      Fact(
          description: "Written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum",
          url: "https://url.com.br",
          categories: [],
          isFavorite: false
      ),
      Fact(
          description: "Written in 45 aBC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum",
          url: "https://url.com.br",
          categories: ["Futebol", "Basquete"],
          isFavorite: false
      )
    ];

    return Right(facts);
  }

}