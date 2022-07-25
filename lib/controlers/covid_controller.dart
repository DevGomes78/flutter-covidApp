import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../constants/service_constants.dart';
import '../data/models/covid_models.dart';

class CovidController extends ChangeNotifier{
  List<Data> lista =[];
  Future<List<Data>> getData()async{
    final response = await http.get(Uri.parse(ServiceConstants.baseUrl));
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

