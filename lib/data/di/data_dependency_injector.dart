import 'package:chuck_norris_facts/data/category_local_data_source_impl.dart';
import 'package:chuck_norris_facts/data/category_remote_data_source_impl.dart';
import 'package:chuck_norris_facts/data/fact_data_source_impl.dart';
import 'package:chuck_norris_facts/data/local/chuck_norris_database.dart';
import 'package:chuck_norris_facts/data/remote/http_client.dart';
import 'package:chuck_norris_facts/data/remote/service/chuck_norris_api_service.dart';
import 'package:chuck_norris_facts/data/remote/service/chuck_norris_api_service_impl.dart';
import 'package:chuck_norris_facts/data/remote/util/connection_status.dart';
import 'package:chuck_norris_facts/data/remote/util/connection_status_impl.dart';
import 'package:chuck_norris_facts/data/search_data_source_impl.dart';
import 'package:chuck_norris_facts/dio/dependency_injector.dart';
import 'package:chuck_norris_facts/domain/dataSources/category_local_data_source.dart';
import 'package:chuck_norris_facts/domain/dataSources/category_remote_data_source.dart';
import 'package:chuck_norris_facts/domain/dataSources/fact_data_source.dart';
import 'package:chuck_norris_facts/domain/dataSources/search_data_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DataDependencyInjector extends DependencyInjector {
  final GetIt getIt;

  DataDependencyInjector({
    required this.getIt,
  });

  @override
  Future<void> inject() async {
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
    getIt.registerSingleton<CategoryRemoteDataSource>(
      CategoryRemoteDataSourceImpl(chuckNorrisApiService: getIt.get()),
    );
    getIt.registerSingleton<CategoryLocalDataSource>(
      CategoryLocalDataSourceImpl(categoryDao: database.categoryDao),
    );
    getIt.registerSingleton<FactDataSource>(
      FactDataSourceImpl(chuckNorrisApiService: getIt.get()),
    );
    getIt.registerSingleton<SearchDataSource>(
      SearchDataSourceImpl(searchDao: database.searchDao),
    );
  }
}

Dio _setupDio() {
  var dio = Dio();
  dio.options.baseUrl = 'https://api.chucknorris.io';
  return dio;
}
