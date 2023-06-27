import 'package:chuck_norris_facts/presentation/pages/home/model/fact_ui.dart';
import 'package:chuck_norris_facts/presentation/pages/home/widget/fact_card_view.dart';
import 'package:flutter/material.dart';

class FactsList extends StatelessWidget {
  final List<FactUi> facts;
  final void Function(FactUi) onClickFavoriteButton;
  final void Function(FactUi) onClickSharedButton;

  const FactsList({
    super.key,
    required this.facts,
    required this.onClickSharedButton,
    required this.onClickFavoriteButton
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: facts.length,
      itemBuilder: (context, index) {
        var fact = facts[index];
        return FactCard(
          factUi: fact,
          onClickFavoriteButton: () => {
            onClickFavoriteButton.call(fact)
          },
          onClickSharedButton: () => {
            onClickSharedButton.call(fact)
          },
        );
      },
    );
  }
}
