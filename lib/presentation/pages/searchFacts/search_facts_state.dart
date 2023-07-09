class SearchFactsState {
  final List<String> lastSearches;
  final String search;
  final List<String> suggestions;
  final bool showLoadingSuggestions;
  final bool showLoadingLastSearches;

  SearchFactsState(
      {this.lastSearches = const [],
      this.search = "",
      this.suggestions = const [],
      this.showLoadingSuggestions = false,
      this.showLoadingLastSearches = false});

  SearchFactsState copyWith({
    List<String>? lastSearches,
    String? search,
    List<String>? suggestions,
    bool? showLoadingSuggestions,
    bool? showLoadingLastSearches,
  }) {
    return SearchFactsState(
      lastSearches: lastSearches ?? this.lastSearches,
      search: search ?? this.search,
      suggestions: suggestions ?? this.suggestions,
      showLoadingSuggestions:
          showLoadingSuggestions ?? this.showLoadingSuggestions,
      showLoadingLastSearches:
          showLoadingLastSearches ?? this.showLoadingLastSearches,
    );
  }
}
