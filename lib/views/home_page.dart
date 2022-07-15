import 'package:flutter/material.dart';
import 'package:flutter_covid_project/views/covid_page_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('App Covid 19',style: TextStyle(fontSize: 25),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        ),
      ),
      body: CovidPageList(),
    );
  }
}
