import 'package:flutter/material.dart';

import 'package:empresta_ai_app/controllers/itens_controller.dart';
import 'package:empresta_ai_app/theme/tema.dart';
import 'package:empresta_ai_app/widgets/item_card.dart';

/// Lista de itens disponíveis no condomínio, com busca (Aulas 9 e 11).
class ItensView extends StatelessWidget {
  const ItensView({super.key, required this.controller});

  final ItensController controller;

  @override
  Widget build(BuildContext context) {
    // ListenableBuilder redesenha a lista sempre que o controller avisa.
  return ListenableBuilder(
    listenable: controller, 
    builder: (context, _) {
      final itens = controller.itens;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              TemaEmprestaAi.espacoM, 
              TemaEmprestaAi.espacoM, 
              TemaEmprestaAi.espacoM, 
              TemaEmprestaAi.espacoP,
              ),
              child: Text(
                'O que você precisa hoje?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: TemaEmprestaAi.espacoM),
              child: TextField(
                onChanged: controller.buscar,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Buscar furadeira, escada...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: TemaEmprestaAi.espacoP),
            Expanded(
              child: itens.isEmpty
                ? Center(
                  child: 
                    Text('Nenhum item encontrado. Tente outra palavra.'))
                : ListView.separated(
                  padding: EdgeInsets.all(TemaEmprestaAi.espacoM), 
                  itemCount: itens.length,
                  separatorBuilder: (_, indice) =>
                    SizedBox(height: TemaEmprestaAi.espacoP),
                  itemBuilder: (context, i) => ItemCard(
                    item: itens[i],
                    // Provisório: a tela de detalhe chega na issue #7.
                    aoTocar: () =>
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Detalhe de ${itens[i].nome}: issue #7')),
                    )
                  ),
                ),
            ),
          ],
        );
      },
    );
  }
}