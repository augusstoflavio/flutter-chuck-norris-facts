sealed class SearchFactsSideEffect {}

class NavigateToPreviousScreenWithSearch extends SearchFactsSideEffect {
  final String search;

  NavigateToPreviousScreenWithSearch({
    required this.search,
  });
}

class ShowDialogError extends SearchFactsSideEffect {
  final String error;

  ShowDialogError({
    required this.error,
  });
}