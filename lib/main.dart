import 'package:chuck_norris_facts/data/di/data_dependency_injector.dart';
import 'package:chuck_norris_facts/data/launcher/data_launcher.dart';
import 'package:chuck_norris_facts/di/dependency_injector.dart';
import 'package:chuck_norris_facts/domain/di/domain_dependency_injector.dart';
import 'package:chuck_norris_facts/launcher/launcher.dart';
import 'package:chuck_norris_facts/presentation/chuck_norris_facts_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  await _setupDi(
    [
      DataDependencyInjector(getIt: getIt),
      DomainDependencyInjector(getIt: getIt),
    ],
  );

  _runLaunchers(
      [
        DataLauncher(syncCategoriesUseCase: getIt.get())
      ]
  );

  runApp(const ChuckNorrisFactsApp());
}

Future<void> _setupDi(
  List<DependencyInjector> dependencyInjectors,
) async {
  for (var dependencyInjector in dependencyInjectors) {
    await dependencyInjector.inject();
  }
}

Future<void> _runLaunchers(
  List<Launcher> launchers,
) async {
  for (var launcher in launchers) {
    await launcher.execute();
  }
}
