import 'package:empresta_ai_app/controllers/itens_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ItensController Testes", (){
    test("pedir marca o item como emprestado e não deixa pedir de novo", (){
      final itensController = ItensController();
      final escada = itensController.itens.firstWhere((i) =>
        i.nome.startsWith("Escada")
    );

      expect(itensController.pedirEmprestado(escada), isTrue);
      expect(escada.disponivel, isFalse);
      expect(itensController.meusPedidos.contains(escada), isTrue);
      expect(itensController.meusPedidos, contains(escada));
      expect(itensController.pedirEmprestado(escada), isFalse);
  });

    test("não deixa pegar emprestado um item já emprestado", (){
      final itensController = ItensController();
      final panela = itensController.itens.firstWhere((i) =>
        i.nome.startsWith("Panela")
      );

      expect(itensController.pedirEmprestado(panela), isFalse);
  });
  });
}