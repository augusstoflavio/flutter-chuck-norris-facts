import 'package:chuck_norris_facts/domain/useCases/disfavor_fact_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/disfavor_fact_use_case_fake.dart';
import 'package:chuck_norris_facts/domain/useCases/favorite_fact_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/favorite_fact_use_case_fake.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case_fake.dart';
import 'package:chuck_norris_facts/presentation/chuck_norris_facts_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<SearchFactsUseCase>(SearchFactsUseCaseFake());
  getIt.registerSingleton<FavoriteFactUseCase>(FavoriteFactUseCaseFake());
  getIt.registerSingleton<DisfavorFactUseCase>(DisfavorFactUseCaseFake());

  runApp(const ChuckNorrisFactsApp());
}