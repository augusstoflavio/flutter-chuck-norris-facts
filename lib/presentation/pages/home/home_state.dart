import 'package:chuck_norris_facts/presentation/pages/home/model/fact_ui.dart';

class HomeState {
  final List<FactUi> facts;


  const HomeState({
    required this.facts,
  });

  HomeState copyWith({
    List<FactUi>? facts,
  }) {
    return HomeState(
      facts: facts ?? this.facts,
    );
  }
}
