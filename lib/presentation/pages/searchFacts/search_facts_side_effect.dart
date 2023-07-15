import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_event.dart';

sealed class SearchFactsSideEffect {}

class NavigateToPreviousScreenWithSearch extends SearchFactsSideEffect {
  final String search;

  NavigateToPreviousScreenWithSearch({
    required this.search,
  });
}

class ShowFailureDialog extends SearchFactsSideEffect {
  final Failure failure;
  final SearchFactsEvent tryAgainEvent;

  ShowFailureDialog({
    required this.failure,
    required this.tryAgainEvent,
  });
}
