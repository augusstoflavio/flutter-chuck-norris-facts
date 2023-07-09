import 'package:chuck_norris_facts/presentation/pages/home/home_page.dart';
import 'package:chuck_norris_facts/presentation/pages/searchFacts/search_facts_page.dart';
import 'package:flutter/material.dart';

class ChuckNorrisFactsApp extends StatelessWidget {
  const ChuckNorrisFactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chuck Norris Facts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/fact/search': (context) => const SearchFactsPage(),
      },
      initialRoute: '/'
    );
  }
}
