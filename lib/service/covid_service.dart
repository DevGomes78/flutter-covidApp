import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/service_constants.dart';
import '../data/models/covid_models.dart';

class CovidService extends ChangeNotifier {
  List<Data> lista = [];
  var decodejson;

  Future<List<Data>> getData() async {
    final response = await http.get(Uri.parse(ServiceConstants.baseApiUrl));
    if (response.statusCode == 200) {
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item) => lista.add(Data.fromJson(item)));
      notifyListeners();
      return lista;
    } else {
      throw Exception('erro');
    }
  }
  Future<Map<String,dynamic>> getupdate() async {
    final response = await http.get(Uri.parse(ServiceConstants.baseApiUrl));
    if (response.statusCode == 200) {
      decodejson = jsonDecode(response.body);
      notifyListeners();
      return decodejson;
    } else {
      throw Exception('erro na pagina');
    }
  }

  Future<List<Data>> getDate({String? query}) async {
    final response = await http.get(Uri.parse(ServiceConstants.baseApiUrl));
    if (response.statusCode == 200) {
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item) => lista.add(Data.fromJson(item)));
      if (query!.length > 1) {
        lista = lista
            .where((item) => item.state!.toLowerCase().contains(
                  query.toLowerCase(),
                ))
            .toList();
      }
      notifyListeners();
      return lista;
    } else {
      throw Exception('erro');
    }
  }
}
