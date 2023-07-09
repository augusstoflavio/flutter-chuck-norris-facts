import 'package:bloc/src/bloc.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/useCases/get_last_searches_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/get_random_suggestions_use_case.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_event.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_side_effect.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_state.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

class SearchFactsBloc  extends SideEffectBloc<SearchFactsEvent, SearchFactsState, SearchFactsSideEffect> {
  final GetLastSearchesUseCase _getLastSearchesUseCase;
  final GetRandomSuggestionsUseCase _getRandomSuggestionsUseCase;

  SearchFactsBloc(
      this._getLastSearchesUseCase,
      this._getRandomSuggestionsUseCase
  ) : super(SearchFactsState()) {

    on<OnInitScreen>((event, emit) {
      _handleOnInitScreen(emit);
    });

    on<OnClickLastSearch>((event, emit) {
      _handleOnClickLastSearch(event);
    });

    on<OnClickSuggestion>((event, emit) {
      _handleOnClickSuggestion(event);
    });

    on<OnSearch>((event, emit) {
      _handleOnSearch(event);
    });
  }

  void _handleOnInitScreen(Emitter<SearchFactsState> emit) {
    _getSuggestions(emit);
    _getLastSearches(emit);
  }

  void _getSuggestions(Emitter<SearchFactsState> emit) async {
    emit(state.copyWith(showLoadingSuggestions: true));

    var suggestionsResult = await _getRandomSuggestionsUseCase.call(5);
    suggestionsResult.fold(
      (failure) => _onGetRandomSuggestionsFailed(failure, emit),
      (suggestions) => _onGetRandomSuggestionsSuccessfully(suggestions, emit)
    );
  }

  void _onGetRandomSuggestionsFailed(Failure failure, Emitter<SearchFactsState> emit) {
    emit(state.copyWith(showLoadingSuggestions: false));

    produceSideEffect(
        ShowDialogError(error: "Problema ao consultar as sugestoes")
    );
  }

  void _onGetRandomSuggestionsSuccessfully(
      List<String> suggestions,
      Emitter<SearchFactsState> emit
  ) {
    emit(
      state.copyWith(
        showLoadingSuggestions: false,
        suggestions: suggestions
      )
    );
  }

  void _getLastSearches(Emitter<SearchFactsState> emit) async {
    emit(state.copyWith(showLoadingLastSearches: true));

    var lastSearchesResult = await _getLastSearchesUseCase.call(10);
    lastSearchesResult.fold(
      (failure) => _onGetLastSearchesFailed(failure, emit),
      (searches) => _onGetLastSearchesSuccessfully(searches, emit)
    );
  }

  _onGetLastSearchesFailed(Failure failure, Emitter<SearchFactsState> emit) {
    emit(state.copyWith(showLoadingLastSearches: false));

    produceSideEffect(
        ShowDialogError(error: "Problema ao consultar as ultimas buscas")
    );
  }

  _onGetLastSearchesSuccessfully(
      List<String> searches,
      Emitter<SearchFactsState> emit
  ) {
    emit(
      state.copyWith(
        showLoadingLastSearches: false,
        lastSearches: searches
      )
    );
  }

  void _handleOnClickLastSearch(OnClickLastSearch event) {
    _navigateToPreviousScreenWithSearch(event.lastSearch);
  }

  void _handleOnClickSuggestion(OnClickSuggestion event) {
    _navigateToPreviousScreenWithSearch(event.suggestion);
  }

  void _handleOnSearch(OnSearch event) {
    _navigateToPreviousScreenWithSearch(event.search);
  }

  void _navigateToPreviousScreenWithSearch(String search) {
    produceSideEffect(NavigateToPreviousScreenWithSearch(search: search));
  }
}