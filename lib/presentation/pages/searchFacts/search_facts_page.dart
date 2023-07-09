import 'package:chuck_norris_facts/domain/useCases/get_last_searches_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/get_random_suggestions_use_case.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_bloc.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_event.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_side_effect.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_state.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/widget/search_facts_last_searches.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/widget/search_facts_suggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

class SearchFactsPage extends StatelessWidget {
  const SearchFactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;

    return BlocProvider(
      create: (_) => SearchFactsBloc(
          getIt<GetLastSearchesUseCase>(),
          getIt<GetRandomSuggestionsUseCase>()
      )..add(OnInitScreen()),
      child: const _SearchFactsPage(),
    );
  }
}

class _SearchFactsPage extends StatelessWidget {
  const _SearchFactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Buscar fatos")
      ),
      body: BlocSideEffectListener<SearchFactsBloc, SearchFactsSideEffect>(
        listener: (BuildContext context, SearchFactsSideEffect sideEffect) {

        },
        child: BlocBuilder<SearchFactsBloc, SearchFactsState>(
          builder: (context, state) {
            return Stack(
              children: _getContent(context, state),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _getContent(BuildContext context, SearchFactsState state) {
    var theme = Theme.of(context);

    List<Widget> stackChildren = [
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Digite sua busca"
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text("Suggestions", style: theme.textTheme.labelLarge),
              const SizedBox(
                height: 8.0,
              ),
              SearchFactsSuggestions(suggestions: state.suggestions),
              const SizedBox(
                height: 16.0,
              ),
              Text("Last searches", style: theme.textTheme.labelLarge),
              const SizedBox(
                height: 8.0,
              ),
              SearchFactsLastSearches(lastSearches: state.lastSearches)
            ],
          ),
        ),
      )
    ];

    if (state.showLoadingLastSearches || state.showLoadingSuggestions) {
      stackChildren.add(
          const Center(
            child: CircularProgressIndicator(),
          )
      );
    }

    return stackChildren;
  }
}
