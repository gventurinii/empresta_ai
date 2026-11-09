import 'package:flutter/material.dart';

import 'package:empresta_ai_app/controllers/itens_controller.dart';
import 'package:empresta_ai_app/models/item.dart';
import 'package:empresta_ai_app/theme/tema.dart';
import 'package:empresta_ai_app/widgets/icone_categoria.dart';

class ItemDetalheView extends StatelessWidget {
  const ItemDetalheView(
    {super.key, required this.item, required this.controller});

    final Item item;
    final ItensController controller;
    
  Future<void> _pedir(BuildContext context) async {
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar pedido?'),
        content: Text(
          'Vamos avisar ${item.dono} (${item.apartamento}) que você quer pegar "${item.nome}".',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), 
            child: Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
    if (confirmou != true || !context.mounted) return;

    final deuCerto = controller.pedirEmprestado(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(deuCerto
          ? 'Pedido enviado! ${item.dono} vai receber um aviso.'
          : 'Essse item acabou de ser emprestado para outra pessoa.'),
      ),
    );
    if (deuCerto) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(item.categoria)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(TemaEmprestaAi.espacoG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: cores.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(iconeDaCategoria(item.categoria),
                  size: 80, color: cores.onPrimaryContainer),
              ),
              SizedBox(height: TemaEmprestaAi.espacoG),
              Text(item.nome, style: textos.headlineSmall),
              SizedBox(height: TemaEmprestaAi.espacoP),
              Text('Dono: ${item.dono} · ${item.apartamento}',
                style: textos.bodyLarge),
                SizedBox(height: TemaEmprestaAi.espacoP),
              Text(
                item.disponivel ? 'Disponível agora' : 'Emprestado no momento',
                style: textos.titleMedium?.copyWith(
                  color: item.disponivel ? cores.primary : cores.error,
                ),
              ),
              Spacer(),
              // Ação principal embaixo: zona de alcance do polegar (Aula 4).
              FilledButton.icon(
                onPressed: item.disponivel ? () => _pedir(context) : null,
                icon: Icon(Icons.handshake),
                label: Text('Pedir emprestado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}