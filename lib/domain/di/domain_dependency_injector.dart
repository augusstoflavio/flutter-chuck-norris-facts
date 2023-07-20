import 'package:chuck_norris_facts/dio/dependency_injector.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository_impl.dart';
import 'package:chuck_norris_facts/domain/repositories/fact_repository.dart';
import 'package:chuck_norris_facts/domain/repositories/fact_repository_impl.dart';
import 'package:chuck_norris_facts/domain/repositories/search_repository.dart';
import 'package:chuck_norris_facts/domain/repositories/search_repository_impl.dart';
import 'package:chuck_norris_facts/domain/useCases/disfavor_fact_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/disfavor_fact_use_case_fake.dart';
import 'package:chuck_norris_facts/domain/useCases/favorite_fact_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/favorite_fact_use_case_fake.dart';
import 'package:chuck_norris_facts/domain/useCases/get_last_searches_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/get_last_searches_use_case_impl.dart';
import 'package:chuck_norris_facts/domain/useCases/get_random_suggestions_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/get_random_suggestions_use_case_impl.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case_impl.dart';
import 'package:chuck_norris_facts/domain/useCases/sync_categories_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/sync_categories_use_case_impl.dart';
import 'package:get_it/get_it.dart';

class DomainDependencyInjector extends DependencyInjector {
  final GetIt getIt;

  DomainDependencyInjector({
    required this.getIt,
  });

  @override
  Future<void> inject() async {
    getIt.registerSingleton<FactRepository>(
      FactRepositoryImpl(factDataSource: getIt.get()),
    );
    getIt.registerSingleton<CategoryRepository>(
      CategoryRepositoryImpl(
        categoryLocalDataSource: getIt.get(),
        categoryRemoteDataSource: getIt.get(),
      ),
    );
    getIt.registerSingleton<SearchRepository>(
      SearchRepositoryImpl(searchDataSource: getIt.get()),
    );

    getIt.registerSingleton<SearchFactsUseCase>(
      SearchFactsUseCaseImpl(
        factRepository: getIt.get(),
        searchRepository: getIt.get(),
      ),
    );
    getIt.registerSingleton<FavoriteFactUseCase>(FavoriteFactUseCaseFake());
    getIt.registerSingleton<DisfavorFactUseCase>(DisfavorFactUseCaseFake());
    getIt.registerSingleton<GetLastSearchesUseCase>(
      GetLastSearchesUseCaseImpl(searchRepository: getIt.get()),
    );
    getIt.registerSingleton<SyncCategoriesUseCase>(
      SyncCategoriesUseCaseImpl(categoryRepository: getIt.get()),
    );

    getIt.registerSingleton<GetRandomSuggestionsUseCase>(
      GetRandomSuggestionsUseCaseImpl(
        categoryRepository: getIt.get(),
      ),
    );
  }
}
