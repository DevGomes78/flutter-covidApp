import 'package:flutter/material.dart';
import 'package:flutter_covid_project/controlers/covid_controller.dart';
import 'package:flutter_covid_project/views/home_page.dart';
import 'package:provider/provider.dart';
import 'controlers/copvid_date_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> CovidController()),
        ChangeNotifierProvider(create: (context)=> CovidDateController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
      brightness: Brightness.dark,
        ),
        home: const HomePage(),
      ),
    );
  }
}

