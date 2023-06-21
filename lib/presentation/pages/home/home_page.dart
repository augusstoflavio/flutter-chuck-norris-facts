import 'package:chuck_norris_facts/presentation/pages/home/home_bloc.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_event.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_state.dart';
import 'package:chuck_norris_facts/presentation/pages/home/widget/fact_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Chuck Norris Facts"),
        actions: [
          IconButton(onPressed: () => {
          },
          icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.facts.length,
              itemBuilder: (context, index) {
                var fact = state.facts[index];
                return FactCard(
                  factUi: fact,
                  onClickFavoriteButton: () => {
                    context.read<HomeBloc>().add(
                        OnClickFavoriteFactButtonEvent(
                          factUi: fact
                        )
                    )
                  },
                  onClickSharedButton: () => {
                    context.read<HomeBloc>().add(
                        OnClickSharedFactButtonEvent(
                            factUi: fact
                        )
                    )
                  },
                );
              },
            );
          }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
