import 'package:chuck_norris_facts/presentation/pages/home/model/fact_ui.dart';
import 'package:flutter/material.dart';

class FactCard extends StatelessWidget {
  final FactUi factUi;
  final VoidCallback? onClickFavoriteButton;
  final VoidCallback? onClickSharedButton;

  const FactCard({
    super.key,
    required this.factUi,
    required this.onClickFavoriteButton,
    required this.onClickSharedButton
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var descriptionStyle =
    factUi.isLarge ? theme.textTheme.headlineSmall : theme.textTheme.bodyLarge;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              factUi.description,
              style: descriptionStyle,
            ),
            const SizedBox(
              height: 6.0,
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              color: theme.colorScheme.primaryContainer,
              child: Text(
                factUi.category,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 11.0),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onClickFavoriteButton,
                  icon: Icon(
                      factUi.isFavorite ? Icons.favorite : Icons.heart_broken,
                      color: factUi.isFavorite ? Colors.red : Colors.grey[400],
                  )
                ),
                const Spacer(),
                IconButton(
                    onPressed: onClickSharedButton,
                    icon: const Icon(
                      Icons.share,
                      color: Colors.green,
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
