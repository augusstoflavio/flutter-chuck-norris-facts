import 'package:chuck_norris_facts/presentation/pages/home/home_event.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_state.dart';
import 'package:chuck_norris_facts/presentation/pages/home/model/fact_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(facts: [
          FactUi(
            category: "Uncategorized",
            description: "Combined with a handful of model sentence structures",
            isLarge: true,
            isFavorite: true,
          ),
          FactUi(
            category: "Music",
            description:
                "written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum",
            isLarge: false,
            isFavorite: false,
          ),
          FactUi(
            category: "Sport",
            description: "Lorem Ipsum as their default model text",
            isLarge: true,
            isFavorite: false,
          ),
        ])) {
    on<OnClickSharedFactButtonEvent>((event, emit) {
      emit(state);
    });

    on<OnClickFavoriteFactButtonEvent>((event, emit) {
      var newFacts = state.facts.map((fact) {
        if (fact.description == event.factUi.description) {
          return fact.copyWith(isFavorite: !fact.isFavorite);
        } else {
          return fact;
        }
      }).toList();

      var newState = state.copyWith(facts: newFacts);
      emit(newState);
    });
  }
}
