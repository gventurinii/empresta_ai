import 'package:empresta_ai_app/fake/itens_fake.dart';
import 'package:empresta_ai_app/models/item.dart';
import 'package:flutter/material.dart';

class ItensController extends ChangeNotifier {
  
  final List<Item> _listaItens = itensDeExemplo();
  final List<Item> meusPedidos = [];
  String _busca = "";

  //Funcões
  List<Item> get itens {
    if(_busca.isEmpty){
      // Se o usuário não digitou nada no campo de busca
      //Eu saio do get e mando a _listaItens sem modificação
      return List.unmodifiable(_listaItens);
    }
    
    final termo = _busca.toLowerCase();

    var itens = _listaItens.where((i) =>
        i.nome.toLowerCase().contains(termo) ||
        i.categoria.toLowerCase().contains(termo)
    );

    return itens.toList();
  }

  void buscar(String texto){
    _busca = texto.trim(); //trim serve para apagar espaço em branco
    notifyListeners();
  }

  //pedir emprestado
  bool pedirEmprestado (Item item){
    if(!item.disponivel) return false;
    item.disponivel = false;
    meusPedidos.add(item);
    notifyListeners();
    return true;
  }

  void devolver(Item item){
    item.disponivel = true;
    meusPedidos.remove(item);
    notifyListeners();
  }


}