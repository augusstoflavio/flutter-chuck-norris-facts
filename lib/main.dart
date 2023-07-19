import 'package:chuck_norris_facts/data/category_data_source_impl.dart';
import 'package:chuck_norris_facts/data/fact_data_source_impl.dart';
import 'package:chuck_norris_facts/data/local/chuck_norris_database.dart';
import 'package:chuck_norris_facts/data/remote/http_client.dart';
import 'package:chuck_norris_facts/data/remote/service/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/data/remote/service/chuck_norris_api_service_impl.dart';
import 'package:chuck_norris_facts/data/remote/util/connection_status.dart';
import 'package:chuck_norris_facts/data/remote/util/connection_status_impl.dart';
import 'package:chuck_norris_facts/data/search_data_source_impl.dart';
import 'package:chuck_norris_facts/domain/dataSources/category_data_source.dart';
import 'package:chuck_norris_facts/domain/dataSources/fact_data_source.dart';
import 'package:chuck_norris_facts/domain/dataSources/search_data_source.dart';
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
import 'package:chuck_norris_facts/presentation/chuck_norris_facts_app.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  final getIt = GetIt.instance;
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorChuckNorrisDatabase
      .databaseBuilder('chuck_norris_database.db')
      .build();

  getIt.registerSingleton<ConnectionStatus>(
    ConnectionStatusImpl(connectivity: Connectivity()),
  );
  getIt.registerSingleton<HttpClient>(
    HttpClient(dio: _setupDio(), connectionStatus: getIt.get()),
  );
  getIt.registerSingleton<ChuckNorrisApiService>(
    ChuckNorrisApiServiceImpl(httpClient: getIt.get()),
  );

  getIt.registerSingleton<CategoryDataSource>(
    CategoryDataSourceImpl(chuckNorrisApiService: getIt.get()),
  );
  getIt.registerSingleton<FactDataSource>(
    FactDataSourceImpl(chuckNorrisApiService: getIt.get()),
  );
  getIt.registerSingleton<SearchDataSource>(
    SearchDataSourceImpl(searchDao: database.searchDao),
  );

  getIt.registerSingleton<FactRepository>(
    FactRepositoryImpl(factDataSource: getIt.get()),
  );
  getIt.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(categoryDataSource: getIt.get()),
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

  getIt.registerSingleton<GetRandomSuggestionsUseCase>(
    GetRandomSuggestionsUseCaseImpl(
      categoryRepository: getIt.get(),
    ),
  );

  runApp(const ChuckNorrisFactsApp());
}

Dio _setupDio() {
  var dio = Dio();
  dio.options.baseUrl = 'https://api.chucknorris.io';
  return dio;
}
