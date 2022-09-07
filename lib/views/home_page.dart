import 'package:flutter/material.dart';
import 'covid_page2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: CovidPage2(),
    );
  }
}
