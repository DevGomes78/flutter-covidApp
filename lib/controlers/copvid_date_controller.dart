import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/models/covid_models.dart';

class CovidDateController extends ChangeNotifier {
  List<Data> listaTotal=[];
List<Data> listaMarco = [];
  List<Data> listaAbril = [];
  List<Data> listaMaio = [];
  List<Data> listaJunho = [];
  List<Data> listaJulho = [];
  List<Data> listaAgosto = [];


  Future<List<Data>> getDate1() async {
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
  Future<List<Data>> getDate2() async {
    final response = await http.get(Uri.parse('https://covid19-brazil-api.vercel.app/api/report/v1/brazil/20220429'));
    if (response.statusCode == 200) {
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item) => listaAbril.add(Data.fromJson(item)));
      notifyListeners();
      return  listaAbril;
    } else {
      throw Exception('erro');
    }
  }
  Future<List<Data>> getDate3() async {
    final response = await http.get(Uri.parse('https://covid19-brazil-api.vercel.app/api/report/v1/brazil/20220529'));
    if (response.statusCode == 200) {
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item) => listaMaio.add(Data.fromJson(item)));
      notifyListeners();
      return  listaMaio;
    } else {
      throw Exception('erro');
    }
  }
  Future<List<Data>> getDate4() async {
    final response = await http.get(Uri.parse('https://covid19-brazil-api.vercel.app/api/report/v1/brazil/20220630'));
    if (response.statusCode == 200) {
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item) => listaJunho.add(Data.fromJson(item)));
      notifyListeners();
      return  listaJunho;
    } else {
      throw Exception('erro');
    }
  }
  Future<List<Data>> getDate5() async {
    final response = await http.get(Uri.parse('https://covid19-brazil-api.vercel.app/api/report/v1/brazil/20220729'));
    if (response.statusCode == 200) {
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item) => listaJulho.add(Data.fromJson(item)));
      notifyListeners();
      return  listaJulho;
    } else {
      throw Exception('erro');
    }
  }
  Future<List<Data>> getDate6() async {
    final response = await http.get(Uri.parse('https://covid19-brazil-api.vercel.app/api/report/v1/brazil/20220829'));
    if (response.statusCode == 200) {
      var decodejson = jsonDecode(response.body);
      decodejson['data'].forEach((item) => listaAgosto.add(Data.fromJson(item)));
      notifyListeners();
      return  listaAgosto;
    } else {
      throw Exception('erro');
    }
  }
}
