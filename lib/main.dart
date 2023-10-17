import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Busca CEP'),
        ),
        body: ListaCep(),
      ),
    );
  }
}

class ListaCep extends StatefulWidget {
  @override
  _ListaCepState createState() => _ListaCepState();
}

class _ListaCepState extends State<ListaCep> {
  
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

//  Integração com a API ViaCep
Future<Map<String, dynamic>> fetchCEP(String cep) async {
  final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falha ao buscar CEP');
  }
}

// Cadastro no Back4App:
Future<void> cadastrarCEP(Map<String, dynamic> data) async {
  final dio = Dio();
  dio.options.headers['X-Parse-Application-Id'] = 'YOUR_APP_ID';
  dio.options.headers['X-Parse-REST-API-Key'] = 'YOUR_REST_API_KEY';

  try {
    final response = await dio.post(
      'https://parseapi.back4app.com/classes/CEP',
      data: data,
    );
    print(response.data);
  } catch (e) {
    print(e.toString());
  }
}

// Listagem de CEPs do Back4App
Future<List<Map<String, dynamic>>> listarCEPs() async {
  final dio = Dio();
  dio.options.headers['X-Parse-Application-Id'] = 'YOUR_APP_ID';
  dio.options.headers['X-Parse-REST-API-Key'] = 'YOUR_REST_API_KEY';

  try {
    final response = await dio.get('https://parseapi.back4app.com/classes/CEP');
    final results = List<Map<String, dynamic>>.from(response.data['results']);
    return results;
  } catch (e) {
    print(e.toString());
    return [];
  }
}
