import 'package:chuck_norris_facts/presentation/pages/home/model/fact_ui.dart';

sealed class HomeEvent {}

final class OnClickSharedFactButtonEvent extends HomeEvent {
  final FactUi factUi;

  OnClickSharedFactButtonEvent({
    required this.factUi,
  });
}

final class OnClickFavoriteFactButtonEvent extends HomeEvent {
  final FactUi factUi;

  OnClickFavoriteFactButtonEvent({
    required this.factUi,
  });
}

final class OnReceiveSearchEvent extends HomeEvent {
  final String search;

  OnReceiveSearchEvent({
    required this.search,
  });
}

final class OnClickSearchButtonEvent extends HomeEvent {
  OnClickSearchButtonEvent();
}