import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../data/models/covid_models.dart';

class CovidController extends ChangeNotifier{
  List<Data> lista =[];
  final String url =
      'https://covid19-brazil-api.vercel.app/api/report/v1';
  Future<List<Data>> getData()async{
    final baseUrl = Uri.parse(url);
    final response = await http.get(baseUrl);
    if(response.statusCode==200){
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item)=>
          lista.add(Data.fromJson(item)));
      notifyListeners();
      return lista;
    }else{
      throw Exception('erro');
    }
  }

}