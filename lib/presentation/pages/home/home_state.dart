import 'package:chuck_norris_facts/presentation/pages/home/model/fact_ui.dart';

class HomeState {
  final List<FactUi> facts;
  final String search;
  final HomeContent content;


  HomeState({
    this.facts = const [],
    this.search = "",
    this.content = HomeContent.messageToSearchFact
  });

  HomeState copyWith({
    List<FactUi>? facts,
    String? search,
    HomeContent? content,
  }) {
    return HomeState(
      facts: facts ?? this.facts,
      search: search ?? this.search,
      content: content ?? this.content,
    );
  }
}

enum HomeContent { loading, messageToSearchFact, messageNoFactFound, listOfFacts }