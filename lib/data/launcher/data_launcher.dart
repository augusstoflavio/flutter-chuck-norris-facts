import 'package:chuck_norris_facts/domain/useCases/sync_categories_use_case.dart';
import 'package:chuck_norris_facts/launcher/launcher.dart';

class DataLauncher extends Launcher {
  final SyncCategoriesUseCase syncCategoriesUseCase;

  DataLauncher({
    required this.syncCategoriesUseCase,
  });

  @override
  Future<void> execute() async {
    await syncCategoriesUseCase.call();
  }
}