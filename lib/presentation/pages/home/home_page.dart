import 'package:chuck_norris_facts/domain/useCases/disfavor_fact_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/favorite_fact_use_case.dart';
import 'package:chuck_norris_facts/domain/useCases/search_facts_use_case.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_bloc.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_event.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_side_effect.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_state.dart';
import 'package:chuck_norris_facts/presentation/pages/home/widget/fact_center_text.dart';
import 'package:chuck_norris_facts/presentation/pages/home/widget/facts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;

    return BlocProvider(
      create: (_) => HomeBloc(
          getIt<SearchFactsUseCase>(),
          getIt<DisfavorFactUseCase>(),
          getIt<FavoriteFactUseCase>()
      ),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Chuck Norris Facts"),
        actions: [
          IconButton(
              onPressed: () => {
                    context
                        .read<HomeBloc>()
                        .add(OnClickSearchButtonEvent())
                  },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocSideEffectListener<HomeBloc, HomeSideEffect>(
        listener: (BuildContext context, HomeSideEffect sideEffect) {
          switch (sideEffect) {
            case OpenSharedUrl():
              {
                Share.share(sideEffect.url);
              }
            case NavigateToSearchScreen(): {

            }
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state.content) {
              case HomeContent.loading:
                return const CircularProgressIndicator();
              case HomeContent.listOfFacts:
                return FactsList(
                    facts: state.facts,
                    onClickSharedButton: (factUi) => {
                          context
                              .read<HomeBloc>()
                              .add(OnClickSharedFactButtonEvent(factUi: factUi))
                        },
                    onClickFavoriteButton: (factUi) => {
                          context
                              .read<HomeBloc>()
                              .add(OnClickFavoriteFactButtonEvent(factUi: factUi))
                        });
              case HomeContent.messageToSearchFact:
                return const FactCenterText(text: "Busque um fato");
              case HomeContent.messageNoFactFound:
                return const FactCenterText(text: "Fatos nao encontrados");
            }
          },
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
