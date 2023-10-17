import 'package:flutter/material.dart';
import 'package:listarcep/Cep.dart';

class CEPProvider with ChangeNotifier {
  List<Cep> _ceps = [];

  List<Cep> get ceps => _ceps;

  void consultarCEP(String cep) {
    // Simulação da consulta ViaCep e cadastro no Back4App
    _ceps.add(Cep(
        cep: cep,
        logradouro: 'Rua Vinte e Cinco de Janeiro',
        complemento: '',
        bairro: 'Martinica',
        localidade: 'Viamão',
        uf: 'RS',
        ibge: '4323002',
        gia: '',
        ddd: '51',
        siafi: '8963'));
    notifyListeners();
  }

  void cadastrarCEP(Cep cep) {
    // Simulação de cadastro no Back4App
    _ceps.add(cep);
    notifyListeners();
  }

  void listarCEPs() {
    // Simulação de listagem de CEPs cadastrados no Back4App
    // Atualizar _ceps com os dados reais do Back4App
    notifyListeners();
  }

  void alterarCEP(Cep cep, int index) {
    // Simulação de atualização no Back4App
    _ceps[index] = cep;
    notifyListeners();
  }

  void excluirCEP(int index) {
    // Simulação de exclusão no Back4App
    _ceps.removeAt(index);
    notifyListeners();
  }
}
