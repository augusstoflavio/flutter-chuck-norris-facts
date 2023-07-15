sealed class SearchFactsEvent {}

final class OnInitScreen extends SearchFactsEvent {}
final class OnClickLastSearch extends SearchFactsEvent {
  final String lastSearch;

  OnClickLastSearch({required this.lastSearch});
}
final class OnClickSuggestion extends SearchFactsEvent {
  final String suggestion;

  OnClickSuggestion({
    required this.suggestion,
  });
}
final class OnSearch extends SearchFactsEvent {
  final String search;

  OnSearch({
    required this.search,
  });
}

final class OnClickTryAgainGetLastSearchesEvent extends SearchFactsEvent {

  OnClickTryAgainGetLastSearchesEvent();
}

final class OnClickTryAgainSuggestionsEvent extends SearchFactsEvent {

  OnClickTryAgainSuggestionsEvent();
}