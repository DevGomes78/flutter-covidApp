import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/models/covid_models.dart';

class CovidDateController extends ChangeNotifier {
  List<Data> listaMarco = [];

  Future<List<Data>> getDate() async {
    final response = await http.get(Uri.parse('https://covid19-brazil-api.vercel.app/api/report/v1/brazil/20220329'));
    if (response.statusCode == 200) {
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item) => listaMarco.add(Data.fromJson(item)));
      notifyListeners();
      return listaMarco;
    } else {
      throw Exception('erro');
    }
  }
}
