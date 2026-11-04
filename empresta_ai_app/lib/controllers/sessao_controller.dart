import 'package:flutter/material.dart';

class SessaoController extends ChangeNotifier {
  static final _formatoApartamento = RegExp(r'^[A-Za-z]-?\d{3}$');
  static final _formatoSenha = RegExp(r'^\d{4}');

  String? _apartamento = "";

  //region Validações apartamento e senha
  
  String? validarApartamento(String apto){
    if(apto == null || apto.trim().isEmpty){
      return "Informe o bloco e apartamento";
    }
    //verifica se o que foi digitado esta no formato regex configurado
    if(!_formatoApartamento.hasMatch(apto)){
      return "Use o formato bloco-número, como A-302 ou B-101";
    }
    return null;
  }

  String? validarSenha(String senha){
    if(senha == null || !_formatoApartamento.hasMatch(senha)){
      return "A senha deve estar no padrão de 4 caracteres";
    }
    return null;
  }
  //endregion
  bool entrar(String apartamento, String senha){
    if(validarApartamento(apartamento) != null) return false;
    if(validarSenha(senha) != null) return false;

    _apartamento = apartamento.trim().toUpperCase();
    notifyListeners();
    return true;
  }

  void sair(){
    _apartamento = null;
    notifyListeners();
  }

}