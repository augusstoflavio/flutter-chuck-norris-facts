import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';
import 'package:chuck_norris_facts/domain/useCases/sync_categories_use_case.dart';

class SyncCategoriesUseCaseImpl extends SyncCategoriesUseCase {
  final CategoryRepository categoryRepository;

  SyncCategoriesUseCaseImpl({
    required this.categoryRepository,
  });

  @override
  Future<void> call() async {
    var categoryResult = await categoryRepository.getOnlineCategories();
    categoryResult.fold(
      (l) {
        // nothing to do
      },
      (categories) async {
        await categoryRepository.saveCategoriesLocally(categories);
      },
    );
  }
}
