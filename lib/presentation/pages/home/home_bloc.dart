import 'package:chuck_norris_facts/domain/models/fact.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/search.dart';
import 'package:chuck_norris_facts/domain/useCases/disfavor_fact_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/favorite_fact_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case.dart';
import 'package:chuck_norris_facts/presentation/pages/home/extension/fact_extension.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_event.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_side_effect.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_state.dart';
import 'package:chuck_norris_facts/presentation/pages/home/model/fact_ui.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

class HomeBloc extends SideEffectBloc<HomeEvent, HomeState, HomeSideEffect> {
  final SearchFactsUseCase _searchFactsUseCase;
  final DisfavorFactUseCase _disfavorFactUseCase;
  final FavoriteFactUseCase _favoriteFactUseCase;

  HomeBloc(
    this._searchFactsUseCase,
    this._disfavorFactUseCase,
    this._favoriteFactUseCase,
  ) : super(HomeState()) {
    on<OnClickSearchButtonEvent>((event, emit) {
      _handleOnClickSearchButton(emit);
    });

    on<OnReceiveSearchEvent>((event, emit) {
      _handleOnReceiveSearch(event, emit);
    });

    on<OnClickSharedFactButtonEvent>((event, emit) {
      _handleOnClickSharedFactButtonEvent(event, emit);
    });

    on<OnClickFavoriteFactButtonEvent>((event, emit) {
      _handleOnClickFavoriteFactButtonEvent(event, emit);
    });
  }

  void _handleOnClickSearchButton(Emitter<HomeState> emit) {
    produceSideEffect(NavigateToSearchScreen());
  }

  void _handleOnReceiveSearch(
      OnReceiveSearchEvent event, Emitter<HomeState> emit) {
    _getListOfFacts(event.search, emit);
  }

  void _handleOnClickSharedFactButtonEvent(
      OnClickSharedFactButtonEvent event, Emitter<HomeState> emit) {
    produceSideEffect(OpenSharedUrl(url: event.factUi.url));
  }

  void _handleOnClickFavoriteFactButtonEvent(
      OnClickFavoriteFactButtonEvent event, Emitter<HomeState> emit) async {
    _toggleFavoriteFactUi(event.factUi, emit);
    var currentFactUi = event.factUi;

    Either<Failure, void> result;
    if (currentFactUi.isFavorite) {
      result = await _disfavorFactUseCase.call(
          currentFactUi.url
      );
    } else {
      result = await _favoriteFactUseCase.call(
          currentFactUi.url
      );
    }

    result.fold(
          (failure) => {
            _toggleFavoriteFactUi(currentFactUi, emit)
          },
          (facts) => {
            // nothing to do
          },
    );
  }

  void _toggleFavoriteFactUi(FactUi factUi, Emitter<HomeState> emit) {
    var newFacts = state.facts.map((fact) {
      if (fact.description == factUi.description) {
        return fact.copyWith(isFavorite: !fact.isFavorite);
      } else {
        return fact;
      }
    }).toList();

    var newState = state.copyWith(facts: newFacts);
    emit(newState);
  }

  void _getListOfFacts(String search, Emitter<HomeState> emit) async {
    emit(state.copyWith(content: HomeContent.loading));

    var factsResult =
        await _searchFactsUseCase.call(Search(description: search));
    factsResult.fold(
      (failure) {
        emit(state.copyWith(content: HomeContent.listOfFacts));
        produceSideEffect(
            ShowFailureDialog(
              failure: failure,
              tryAgainEvent: OnClickTryAgainEvent(search: search),
            )
        );
      },
      (facts) => {_onSearchFactsSuccessfully(facts, emit)},
    );
  }

  void _onSearchFactsSuccessfully(List<Fact> facts, Emitter<HomeState> emit) {
    var factsUi = facts
        .map((fact) => fact.toFactUi())
        .toList();

    emit(state.copyWith(facts: factsUi, content: HomeContent.listOfFacts));
  }
}
