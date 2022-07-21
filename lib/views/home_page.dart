import 'package:flutter/material.dart';
import 'package:flutter_covid_project/views/covid_page_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CovidPageList(),
    );
  }
}
